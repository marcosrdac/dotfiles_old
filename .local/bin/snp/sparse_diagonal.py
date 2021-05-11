import numpy as np
from scipy.sparse import dia_matrix

def diags(vals, shape=None):
    vals = np.asarray(vals)
    if shape is None:
        shape = vals.size, vals.size
    return dia_matrix((vals, 0), shape=shape)

if __name__ == '__main__':
    diag = diags([1,2,3], (3,6))

    print((diag.T@diag).toarray())
