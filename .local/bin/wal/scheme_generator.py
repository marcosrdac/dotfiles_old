import numpy as np
from median_cut import get_scheme

# STD_COLORS = np.asarray([
    # (0.0, 0.0, 0.0),  # black
    # (1.0, 0.0, 0.0),  # red
    # (0.0, 1.0, 0.0),  # green
    # (1.0, 1.0, 0.0),  # yellow
    # (0.0, 0.0, 1.0),  # blue
    # (1.0, 0.0, 1.0),  # magenta
    # (0.0, 1.0, 1.0),  # cyan
    # (1.0, 1.0, 1.0),  # white
# ])

# COLORS = np.append(.4+.6*STD_COLORS, .4+.6*STD_COLORS, axis=0)
# COLORS[0] = 0.01

def perc_to_hex(r, g, b):
    r, g, b = (int(255*c) for c in [r,g,b])
    return f'#{r:02x}{g:02x}{b:02x}'

def get_colors(path):
    # colors = COLORS
    colors = get_scheme(path, 3)
    if len(colors) == 8:
        light_colors = 1.30 * colors  # change it
        colors = np.append(colors, light_colors, axis=0)
    elif len(colors) != 16:
        raise Exception('Number of colors is not 8 or 16!')
    return colors

def gen_wal_scheme(path):
    colors = get_colors(path)
    scheme = {
        'wallpaper': path,
        'alpha': '100',
        'colors': 
            {f'color{i}': perc_to_hex(*c) for i,c in enumerate(colors)},
        'special': {
            'background': perc_to_hex(*colors[0]),
            'foreground': perc_to_hex(*colors[7]),
            'cursor': perc_to_hex(*colors[7]),
        },
    }
    return scheme

if __name__ == '__main__':
    scheme = gen_wal_scheme('/home/marcosrdac/res/wal/favorites/bridge_pink_blue_peaceful_wakening_gc.jpg')
    print(scheme)
