import numpy as np
import pandas as pd

def true_positive(cm, label=None):
    tp = cm.loc[label:label, label]
    return tp.values.sum()

def false_positive(cm, label=None):
    non_label = [i for i in cm.index if i!=label]
    fp = cm.loc[non_label, label:label]
    return fp.values.sum()

def true_negative(cm, label=None):
    non_label = [i for i in cm.index if i!=label]
    tn = cm.loc[non_label, non_label]
    return tn.values.sum()

def false_negative(cm, label=None):
    non_label = [i for i in cm.index if i!=label]
    fn = cm.loc[label:label, non_label]
    return fn.values.sum()

def accuracy(tp, fp, fn, tn):
    return (tp+tn)/cm.values.sum()

def precision(tp, fp, fn, tn):
    return tp/(tp+fp)

def recall(tp, fp, fn, tn):
    return tp/(tp+fn)

def f1_score(*args):
    return 2*(precision(*args)*recall(*args) /
              (precision(*args)+recall(*args)))

def cm_metric(cm, label=None, metric=accuracy):
    labels = cm.columns if label is None else [label]
    value = 0
    for label in labels:
        tp = true_positive(cm, label)
        fp = false_positive(cm, label)
        fn = false_negative(cm, label)
        tn = true_negative(cm, label)
        value += metric(tp, fp, fn, tn)
    value /= len(labels)
    return value

def cm_accuracy(cm, label=None):
    return cm_metric(cm, label=label, metric=accuracy)

def cm_precision(cm, label=None):
    return cm_metric(cm, label=label, metric=precision)

def cm_f1_score(cm, label=None):
    return cm_metric(cm, label=label, metric=f1_score)

def cm_recall(cm, label=None):
    return cm_metric(cm, label=label, metric=recall)
