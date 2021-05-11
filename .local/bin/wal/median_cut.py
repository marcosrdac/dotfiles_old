import numpy as np
from PIL import Image
from utils import rgb_to_hsv, hsv_to_rgb
 

def median_cut_tree(pix, level=1):
    if level > 0:
        split = pix.shape[0]//2
        col = np.argmax(np.ptp(pix, axis=0))
        idx = pix[:,col].argsort()
        lnode = median_cut_tree(pix[idx[:split]],level-1)
        rnode = median_cut_tree(pix[idx[split:]],level-1)
        nodes = lnode, rnode
    else:
        nodes = pix.mean(axis=0)
    return nodes


def median_cut(pix, levels, domain='rgb'):
    def get_leaves(tree):
        return np.asarray(tree).reshape(-1, pix.shape[-1])
    
    if domain=='rgb':
        transform = inv_transform = lambda x: x
    elif domain=='hsv':
        transform, inv_transform = rgb_to_hsv, hsv_to_rgb
    elif domain=='lab':
        transform, inv_transform = rgb_to_lab, lab_to_rgb
    else:
        raise Exception('Cannot understand color space.')
    
    pix = transform(pix)
    leaves = get_leaves(median_cut_tree(pix, levels))
    leaves = inv_transform(leaves)
    
    leaves = rgb_to_hsv(leaves)
    idx = leaves[:,2].argsort()
    leaves = leaves[idx]
    leaves = hsv_to_rgb(leaves)
    return leaves


def open_image(path):
    return np.asarray(Image.open(path))/255


def get_scheme(path, splits=3):
    img = open_image(path)
    pix = img.reshape((-1,3))
    colors = median_cut(pix, splits)
    return colors


if __name__ == '__main__':
    import matplotlib.pyplot as plt

    path = '/home/marcosrdac/res/wal/favorites/bridge_pink_blue_peaceful_wakening_gc.jpg'

    img = open_image(path)
    pix = img.reshape((-1,3))
    colors = median_cut(pix, 3)

    fig = plt.figure()

    ax = fig.add_axes([.05,.3,.9,.6])
    ax.imshow(img)

    cax = fig.add_axes([.05,.05,.9,.15])
    cax.matshow(colors[None,:,:])

    plt.show()
