# -*- coding: utf-8 -*-
"""
Created on Mon Apr  6 16:38:00 2020

@author: pepeb
"""


import numpy as np

def costFunction(tetha0, tetha1, x, y):
    v = 0
    for i in range(len(x)):
        v = v + ((tetha0 + tetha1*x[i])-y[i])**2
    return v/len(x) 

def hypothesis(tetha0, tetha1, x1):
    return (tetha0+ tetha1*x1)

x = [1, 2, 4, 0]
y = [0.5, 1, 2, 0]

tetha0 = -2
tetha1 = 0.5

print(costFunction(tetha0, tetha1, x, y))

tetha0 = -1
tetha1 = 0.5

print(hypothesis(tetha0, tetha1, 4))



