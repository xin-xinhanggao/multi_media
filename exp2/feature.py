from PIL import Image
import numpy

def getFeature(img, partition):
    lev = numpy.asarray([partition[0], partition[1], partition[2]], dtype='int')
    rng = 255 / lev
    tp = (img / rng).astype('int')
    cnt = numpy.zeros(lev)
    for i in xrange(lev[0]):
        for j in xrange(lev[1]):
            for k in xrange(lev[2]):
                cnt[i, j, k] = numpy.sum(numpy.all(tp == (i, j, k), axis=2)) 
    return cnt / img.shape[0] / img.shape[1]