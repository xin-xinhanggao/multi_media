from query import query
import sys

featurelist = ["242", "484"]
distancelist = ["L2", "HI", "Bh"]

if __name__ == "__main__":
	if len(sys.argv) == 5:
		if sys.argv[3] in featurelist and sys.argv[4] in distancelist:
			query(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
		else:
			print "Parameters error!"
			print "Histogram choice", featurelist
			print "Ditance choice", distancelist
	elif len(sys.argv) == 3:
		if sys.argv[1] in featurelist and sys.argv[2] in distancelist:
			query("QueryImages.txt", "AllImages.txt", sys.argv[1], sys.argv[2])
		else:
			print "Parameters error!"
			print "Histogram choice", featurelist
			print "Ditance choice", distancelist
	else:
		print "Default parameter use 16bins and L2 metric"
		query("QueryImages.txt", "AllImages.txt", "242", "L2")   
		print "Usage:"
		print "python main.py query_file dataset_file histogram_choice distance_choice"
		print "Histogram choice", featurelist
		print "Ditance choice", distancelist

