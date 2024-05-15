(# freqs
	(collect (count 20000) 20000))

(fun aaa
	(t
		(rv 1 50)
		(fractRandTimer (ch 0.01 0.1 0.8))))

(step-pan-gen
	(hold 
		(cycle (count 20000))
		(seq aaa aaa aaa aaa aaa))
	(st 1)
	(hold 
		(cycle (count 20000))
		(seq aaa aaa aaa aaa aaa)))