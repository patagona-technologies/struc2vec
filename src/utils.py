# -*- coding: utf-8 -*-

import pickle
import os.path
import logging
import pathlib
import inspect
from itertools import islice
from time import time

dir_f = os.path.abspath(os.getcwd())
folder_pickles = os.path.join(dir_f, "pickles")
logging.info('Parent Directory: ', dir_f)

def returnPathStruc2vec():
    return dir_f

def isPickle(fname):
    file_path = os.path.join(dir_f, 'pickles', fname+'.pickle')
    return os.path.isfile(file_path)

def chunks(data, SIZE=10000):
    it = iter(data)
    for i in range(0, len(data), SIZE):
        yield {k:data[k] for k in islice(it, SIZE)}

def partition(lst, n):
    division = len(lst) / float(n)
    return [ lst[int(round(division * i)): int(round(division * (i + 1)))] for i in range(n) ]

def restoreVariableFromDisk(name):
    logging.info('Recovering variable...')
    t0 = time()
    val = None
    file_path = os.path.join(folder_pickles, name + '.pickle')
    with open(file_path, 'rb') as handle:
        val = pickle.load(handle)
    t1 = time()
    logging.info('Variable recovered. Time: {}m'.format((t1-t0)/60))

    return val

def saveVariableOnDisk(f,name):
    logging.info('Saving variable on disk...')
    t0 = time()
    file_path = os.path.join(folder_pickles, name + '.pickle')
    with open(file_path, 'wb') as handle:
        pickle.dump(f, handle, protocol=pickle.HIGHEST_PROTOCOL)
    t1 = time()
    logging.info('Variable saved. Time: {}m'.format((t1-t0)/60))

    return
