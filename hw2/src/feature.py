from PIL import Image
import numpy
import math

def getFeature(img, partition):
    lev = numpy.asarray([partition[0], partition[1], partition[2]], dtype='int')
    rng = 255 / lev
    tp = (img / rng).astype('int')
    cnt = numpy.zeros(lev)
    width = img.shape[0]
    height = img.shape[1]

    total_weight = 0

    sigma = 0.6
    if sigma == 0:
        for i in xrange(lev[0]):
            for j in xrange(lev[1]):
                for k in xrange(lev[2]):
                    cnt[i, j, k] = numpy.sum(numpy.all(tp == (i, j, k), axis=2))
    else:
        for x in xrange(width):
            for y in xrange(height):
                color = tp[x][y]
                if color[0] < lev[0] and color[1] < lev[1] and color[2] < lev[2]:
                    x_1 = x * 1.0 / width
                    y_1 = y * 1.0 / height
                    r = (x_1 - 0.5) * (x_1 - 0.5) + (y_1 - 0.5) * (y_1 -0.5)
                    weight = math.exp(-r / 2 / sigma / sigma) / 2 / numpy.pi / sigma / sigma
                    cnt[color[0]][color[1]][color[2]] += weight
                    total_weight += weight
                    
    if sigma == 0:
        total_weight = img.shape[0] * img.shape[1]

    return cnt / total_weight