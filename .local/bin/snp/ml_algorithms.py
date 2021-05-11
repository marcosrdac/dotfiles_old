import numpy as np


def sigmoid(z):
    return 1 / (1 + np.exp(-z))


def log_reg(w, x):
    return sigmoid(np.dot(w, x))


def gradient_descent(uX_train, y_train, epochs=30, step=0.1, w0=None):
    '''
    Gradient descent method for training logistic regression coeficients.
    uX_train is X_train concatenated with u, a vector of ones.
    '''
    N, M = uX_train.shape
    w = w0 or np.empty(M)
    for epoch in range(epochs):
        for i in range(N):
            x, y = uX_train[i], y_train[i]
            ŷ = log_reg(w, x)
            res = ŷ - y
            gradient = np.dot(x, res) * x
            w = w - step * gradient 
    return w


def knn(X_train, y_train, X_test, k=3, classify=True):
    N_train = X_train.shape[0]
    N_test = X_test.shape[0]

    proba = np.zeros((2, N_test))
    dists = np.zeros(N_train)

    for i in range(N_test):
        pi = X_test[i]

        for j in range(N_train):
            pj = X_train[j]
            dists[j] = dist(pi, pj)

        nearest = np.argsort(dists)[:k]
        labels = y_train[nearest]
        proba[1, i] = np.sum(labels) / k
        proba[0, i] = 1.0 - proba[1, i]

    if classify:
        return 1 * (proba[1, :] > .50)
    else:
        return proba


def weighted_knn(X_train, y_train, X_test, k=3, classify=True):
    N_train = X_train.shape[0]
    N_test = X_test.shape[0]

    proba = np.empty((2, N_test))
    dists = np.empty(N_train)
    w = np.empty(k)

    for i in range(N_test):
        pi = X_test[i]
        zero_idx = None
        for j in range(N_train):
            pj = X_train[j]
            dists[j] = np.linalg.norm(pj - pi)
            if dists[j] == 0.:
                zero_idx = j
                break

        if zero_idx is not None:
            proba[1, i] = y_train[zero_idx]
        else:
            nearest = np.argsort(dists)[:k]
            w[:] = 1. / dists[nearest]
            w /= w.sum()
            y = y_train[nearest]
            proba[1, i] = np.dot(w, y)
        proba[0, i] = 1.0 - proba[1, i]

    if classify:
        return 1 * (proba[1, :] > .50)
    else:
        return proba


def kmeans(X, k=2, n_iter=3):
    N, M = X.shape
    y = np.random.randint(0, k, size=N)
    c = np.empty((k, M))
    dists = np.empty((N, k))
    for t in range(n_iter):
        for i in range(k):
            c[i] = np.mean(X[y == i], axis=0)
            dists[:, i] = np.linalg.norm(X - c[i], axis=1)
        y = np.argmin(dists, axis=1)
    return c, y
