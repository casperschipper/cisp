(# tab1 (fillf 44100 0 0))

(samp-schedule
	(write tab1 
		(* 1.1 (dacin (st 0)))
		(count (table-cap tab1)))
	(st 1))

(fun speed
	(t 
		(ch 0.5 1.0 2.0 4.0)
		(ch 0.1 0.2 0.5 1.0 2.0 4.0)))

(fun top 
	(t
		(ch 10000 2000 300 20 10 2 )
		(fractRandTimer (ch 0.001 0.002 0.02 1.0 2.0 3.0 4.0))))

(fun liner
	(line 
		(seq top)
		(t 
			(ch 0.001 0.002 0.01 1.0 0.4 0.01 0.02 0.3)
			(ch 0.01 0.2 0.3 0.4 1.0 4.0))))

(# amps (fillf 16 -10000 10000))
(# holds (1. 2 3 4 55 10 19 200 1 2 3 4 2 4 5 6 32 8 9 18293 7 172 31))

(fun a 
	(line (seq 0 16)
		(ch .3 .5 1.7))
	)

(fun ssp
	(hold 
	(index amps (rv a a))
	(* (index holds (rv a a)) 100)))




(clone
(step-gen
	(* (index-lin tab1 (+ (list ssp  (bounded-walk (st 0) (table-cap tab1) speed)))) (index-lin tab1 (+ (list liner liner (bounded-walk (st 0) (table-cap tab1) speed)))))
	(st 1)
	:pan (rvfi -1 1))
2)