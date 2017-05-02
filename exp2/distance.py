from PIL import Image
import numpy

def L2(u,v):
    t = u - v
    return numpy.sqrt(numpy.sum(t * t))

def HI(u,v):
    return -numpy.sum((u <= v) * u + (v < u) * v)

def Bh(u,v):
    tmp = min(numpy.sum(numpy.sqrt(u * v)), 1.0)
    return numpy.sqrt(1. - tmp)