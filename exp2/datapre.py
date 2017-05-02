from PIL import Image
from load import loadImg
from feature import getFeature

def extract(filename, fchoice):
    imgname = map(lambda x: x.split(), open(filename).readlines())
    imgname = filter(lambda x: len(x) == 3, imgname)
    imgname = map(lambda x: x[0], imgname)
    imgdata = map(loadImg, imgname)
    imgfeature = []
    for img in imgdata:
        imgfeature.append(getFeature(img, fchoice))
    return imgname, imgdata, imgfeature