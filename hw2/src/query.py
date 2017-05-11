from datapre import extract
from distance import L2, HI, Bh, ch
import os
import numpy

def query(filename1, filename2, fchoice, dchoice, sal_choice = False):
    queryname, querydata, queryfeature = extract(filename1, fchoice, sal_choice)
    imgname, imgdata, imgfeature = extract(filename2, fchoice, sal_choice)
    correct = 0
    total = 0
    outdir = os.path.join('result', dchoice + ' ' + fchoice)
    if not os.path.isdir(outdir):
        os.makedirs(outdir)

    overall = open(os.path.join(outdir, 'res_overall.txt'), 'w')
    for name, data, feature in zip(queryname, querydata, queryfeature):
        if dchoice == "L2":
            score = map(lambda x: L2(x, feature), imgfeature)
        elif dchoice == "HI":
            score = map(lambda x: HI(x, feature), imgfeature)
        elif dchoice == "Bh":
            score = map(lambda x: Bh(x, feature), imgfeature)
        elif dchoice == "ch":
            score = map(lambda x: ch(x, feature), imgfeature)

        index = numpy.argsort(score)
        tcorrect = 0.
        ttotal = 0.
        outfile = open(os.path.join(outdir, 'res_' + name[:-4].replace('/', '_') + '.txt'), 'w')
        for i in xrange(30):
            print >> outfile, imgname[index[i]], "%.4lf" % abs(score[index[i]])
            if imgname[index[i]].split('/')[0] == name.split('/')[0]:
                tcorrect += 1
            ttotal += 1
        print >> overall, name, "%.4lf" % (tcorrect / ttotal)
        correct += tcorrect
        total += ttotal
        outfile.close()

    print >> overall, "%.4lf" % (correct / total)
    overall.close()