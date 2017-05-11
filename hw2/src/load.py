from PIL import Image
import numpy
import os

def loadImg(filename):
    imgsrc = Image.open(os.path.join('DataSet', filename))
    img = imgsrc.copy()
    imgsrc.close()
    return numpy.asarray(img)