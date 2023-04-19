(# tab1 (fillf 44100 0 0))

(samp-schedule
	(write tab1 (audioIn (st 0)) (count (table-cap tab1)))
	(st 1)
)

(fun speed
	(t 
		(ch 1 2 3)
		(ch 0.1 0.4 6.2)))

(fun walker
	(bounded-walk (st 0) (table-cap tab1) speed))

(fun liner
	(line 
		(seq 0 10)
		(t (/ 1.0 (rf -40 80)) (ch 0.1 0.01 0.02 0.3 0.8 1.0 2.0))))

(step-pan-gen
	(* (index-lin tab1 (+ walker liner)) 4.0)
	(st 1)
	(line (seq 0 1) (fractRandTimer (ch 0.01 0.02 0.2 0.3 0.4 0.5 1.0 2.0)))
	)