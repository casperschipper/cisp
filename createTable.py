w, h = 64, 64

array = [[0 for x in range(w)] for y in range(h)] 
print array

row = -1;
for divider in [2,4,8,16,32]:
	sectionSize = 64 / divider; # find how many ones
	print "number of ones :", sectionSize
	for section in range(divider):  # 0, 1
		row = row + 1
		for index in range(sectionSize):
			cellIndex = (section * sectionSize) + index
		  	print "section", section, "cellIndex",cellIndex, "row", row, "value", 1
		  	array[row][cellIndex] = 1

for i in array:
	print i ,","
	print "\n"