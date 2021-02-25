#!/usr/bin/env python

from os import environ
from os.path import join, expanduser, isfile
from datetime import datetime
import sys
import numpy as np
from scipy.ndimage.filters import gaussian_filter1d
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

DOCUMENTS = environ.get('XDG_DOCUMENTS_DIR',
                        expanduser(join('~', 'Documents')))

LOGFILE = join(DOCUMENTS, 'log', 'emotion')

data = pd.read_csv(LOGFILE,
                   delimiter='\t',
                   names=['t', 'sen', 'att', 'ple', 'apt', 'sti'],
                   header=None,
                   index_col=0,
                   parse_dates=True)

columns = data.columns
emoaxes = ['sen', 'att', 'ple', 'apt']
emocolors = ['red', 'yellow', 'green', 'blue']
emotions = data[emoaxes]
smooth_emotions = data[emoaxes].copy()



for i in emoaxes:
    smooth_emotions[i] =  gaussian_filter1d(smooth_emotions[i], sigma=.5)

print(emotions.describe())

plt.hlines(0, xmin=emotions.index.min(), xmax=emotions.index.max())
for i, axis in enumerate(emoaxes):
   #plt.plot(emotions[axis], color=emocolors[i])
   plt.plot(smooth_emotions[axis], color=emocolors[i])
plt.show()


# sns.pairplot(emotions, kind='relplot', diag_kind='kde')
# sns.kdeplot(emotions, shade=True)
# g = sns.PairGrid(emotions)
# g.map_upper(sns.kdeplot, shade=True)
# g.map_diag(sns.kdeplot, lw=2)
# g.map_lower(sns.kdeplot, shade=True)
# for j in range(3):
#    # for i in range(3):
#        # if i!=j:
#            # g.axes[i,j].set_xlim(-3, 3)
#            # break
#            # g.axes[i,j].set_ylim(-3, 3)
#    # else:
#        # break
#
#
# plt.show()
