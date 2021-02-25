def elbow_analysis(model, X, k_min=2, k_max=15, return_best=False, samples=3):
    range_k = np.arange(k_min, k_max+1)
    
    var = [[model(k).fit(X).inertia_ for k in range_k]
           for i in range(samples+1)]
    var = np.stack(var, axis=1)
    var_mean = var.mean(axis=1)
    var_std = var.std(axis=1)
    dist = [elbow_distance(range_k ,var[:,i])
            for i in range(var.shape[1])]
    dist = np.stack(dist, axis=1)
    dist_mean = dist.mean(axis=1)
    dist_std = dist.std(axis=1)
      
    fig, axes = plt.subplots(1,2, figsize=(14,4))
    axes[0].set_title(r'Intra-cluster variance $\times$ N. clusters')
    axes[0].set_ylabel('Variance')
    axes[0].errorbar(range_k, var_mean, var_std, marker='o')
    axes[0].plot(range_k[[0,-1]], var_mean[[0,-1]])
    axes[1].set_title(r'Distance $\times$ N. Clusters')
    axes[1].set_ylabel('Elbow distance')
    axes[1].errorbar(range_k, dist_mean, dist_std, marker='o')
    axes[1].plot(range_k[[0, -1]], [0,0])
    
    for ax in axes:
        ax.set_xlabel('N. Clusters')
        ax.set_xticks(range_k)
        ax.grid() 
        
    if return_best:
        best_idx = np.argsort(dist_mean)[::-1]
        best = k[best_idx[:return_best]]
        return best
