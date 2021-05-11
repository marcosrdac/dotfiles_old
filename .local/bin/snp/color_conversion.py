import numpy as np
import warnings

def rgb2hsv_pure(r, g, b):
    r, g, b = r/255, g/255, b/255

    v = max(r, g, b)
    d = v - min(r, g, b)

    get_h = lambda phi: (phi + 60*(g-b)/d) %360

    if d == 0: h = 0
    elif v == r: h = get_h(0)
    elif v == g: h = get_h(120)
    elif v == b: h = get_h(240)

    s = 0 if v==0 else 100*d/v
    v = 100 * v
    return h, s, v


def rgb2hsv(rgb):
    hsv = np.empty(rgb.shape, dtype=float)
    rgb = rgb / 255
    (r,g,b), (h,s,v) = rgb.T, hsv.T

    max_idx = np.argmax(rgb, axis=1)
    v[:] = np.take_along_axis(rgb, np.expand_dims(max_idx, axis=1), axis=1).flat
    d = v - np.min(rgb, axis=1)

    with np.errstate(invalid='ignore'):
        h[:] = (120*max_idx + 60*(g-b)/d) % 360
        s[:] = 100*d/v
    hsv.T[...] = np.nan_to_num(h), np.nan_to_num(s), 100*v
    return hsv
