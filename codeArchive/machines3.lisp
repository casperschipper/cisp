(# ts (1. 3 5 7 11 13 17 21 55 333))

(fun a
	(line
	(seq 0 (table-cap ts))
	(ch .1 .5 4)))

(fun b
	(t
		(seq 1 10 100)
		(fractRandTimer (ch 0.001 0.1 0.2 3.0)))
	)

	(step-gen
    (hold 
    	(index 
    		(
    			(seq -1 1) 
    			(t (seq -1 1) (hold (ch 0.02 0.03 0.06) (ch 4 8 16)))

    		)
    		(t (count 2) (rv 4 5)))
    	(* (index ts (rv a a)) b))
	(st 1))