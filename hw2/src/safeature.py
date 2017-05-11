from skimage.io import imread, imsave
from saliency import compute_saliency
import numpy
import math
import os

def saFeature(imgname, partition):
    img = imread(os.path.join('DataSet', imgname))
    img = img[:, :, :3]
    lev = numpy.asarray([partition[0], partition[1], partition[2]], dtype='int')
    rng = 255 / lev
    tp = (img / rng).astype('int')
    cnt = numpy.zeros(lev)
    width = img.shape[0]
    height = img.shape[1]
    img_sal = compute_saliency(img)

    total_weight = 0

    for x in xrange(width):
        for y in xrange(height):
            color = tp[x][y]
            if color[0] < lev[0] and color[1] < lev[1] and color[2] < lev[2]:
                cnt[color[0]][color[1]][color[2]] += img_sal[x][y]
                total_weight += img_sal[x][y]
                    
    return cnt / total_weight 