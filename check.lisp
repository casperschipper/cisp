(# lst 
	(list 1. 2 3 5 7 11 13 14 100 33 23 17 203 333 116 18))

(fun b 
	(line 
			(seq 0 (table-cap lst))
			(rv 5 10)))

(fun a
	(line (seq b b)
		(fractRandTimer (ch 0.001 0.002 0.03 0.05 0.2 0.3 0.4))))

(step-gen
	(seq -1 1)
	(index lst a))