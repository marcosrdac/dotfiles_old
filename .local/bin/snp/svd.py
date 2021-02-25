import scipy as scp
from scipy.linalg import diagsvd

U, s, VT = np.linalg.svd(X0)
S = diagsvd(s, *X0.shape)
V = VT.T
