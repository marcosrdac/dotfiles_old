#!/usr/bin/env python

from os import environ
from os.path import join, expanduser, isfile
from datetime import datetime
import sys
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

DOCUMENTS = environ.get('XDG_DOCUMENTS_DIR', expanduser(join('~', 'Documents')))
                            
LOGFILE = join(DOCUMENTS, 'log', 'emotion')

data = pd.read_csv(LOGFILE,
                   delimiter='\t',
                   names=['t', 'sen', 'att', 'ple', 'apt', 'sti'],
                   header=None,
                   index_col=0,
                   parse_dates=True)

columns = data.columns

#plt.imshow(data[['sen', 'att', 'ple', 'apt']].T, cmap='coolwarm', aspect='auto')
#plt.colorbar(orientation='horizontal')

sns.heatmap(data[['sen', 'att', 'ple', 'apt']].T,
            cmap='coolwarm',
            vmin=-3, vmax=3,
            cbar_kws={'orientation': 'horizontal'})

plt.xticks([])
plt.show()
