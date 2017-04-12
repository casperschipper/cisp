(fun verySlowOctaver 
	(line (ch 0.01 0.125 0.25 0.5 1.0) (ch 16 32 64)))

(fun alpha 
	(line (seq 1 80) (* (fractRandTimer 0.0001) verySlowOctaver )))

(fun slowFielder
	(line (rv 1 128)
		(rv 1 40)))

(# table (collect (walk 0 (ch -0.1 0.1)) 128))

(clone 
(step-gen
	(seq -1 1)
	(hold (list-walk (1 2 3 4 5 6 7 8 alpha) (ch -1 1)) (list-walk (1 2 3 4 5 6 7 8) (ch -1 1))))
3)