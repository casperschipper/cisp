(sync 0.14)

(~ stepsize
	(rv 0 (slider 2)))


(step-gen
	(index-lin OSC.table1 (linlin (slider 2) 0 128 2 3))
	(st 1))
