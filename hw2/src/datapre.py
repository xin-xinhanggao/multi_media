from PIL import Image
from load import loadImg
from feature import getFeature
from safeature import saFeature

def extract(filename, fchoice, sal):
    imgname = map(lambda x: x.split(), open(filename).readlines())
    imgname = filter(lambda x: len(x) == 3, imgname)
    imgname = map(lambda x: x[0], imgname)

    imgdata = map(loadImg, imgname)
    imgfeature = []

    if sal:
    	for name in imgname:
    		imgfeature.append(saFeature(name, fchoice))
    else:
    	for img in imgdata:
        	imgfeature.append(getFeature(img, fchoice))

    return imgname, imgdata, imgfeature