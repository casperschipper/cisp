(# lst 
	(list 100. 200 300 1 2 3 4 10 11 15 100 33 14 2 3 99 303))

(fun b 
	(line 
			(seq 0 (table-cap lst))
			(rv 5 10)))

(fun a
	(line (seq b b)
		(fractRandTimer (ch 0.001 0.002 0.03 0.05 0.2 0.3 0.4))))

(fun level
	(line (seq -1 1)
		(ch 0.1 0.2 0.5 1.0 2.0 4.0)))

(step-gen
	(seq (* -1 level) level)
	(index lst a))