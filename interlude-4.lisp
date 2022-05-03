(# table
	(alloc 51000))
	

(samp-schedule
	(write table (* (audioIn 0) 40) (count (table-cap table)))
	(t (ch 1) (ch 0.1 0.5 1 2 3)))

(fun filter (input)
	(biquad input 1 (rvfi 100 9000) 3.0 100.0))

(fun amp
	(line
		(seq 0 1)
		(* (seq 3 7 (ch 1 5) 3) 0.5)  ))

(# mask1
	(1. 3 5 13 17 21 35 44 88 121 133 145 1000 2000 3400 7676 9832 10000 44000 545400))

(~ tendency1 
	(line
		(ch 0 1)
		(ch 0.5 3 7)))

(~ tendency2 
	(line
		(ch (rv 0 0.2) 1)
		(ch 0.5 3 7)))

(fun rem
	(t 
		(/ 1.0 (rf 4 128))
		(fractRandTimer (ch 0.01 0.1 0.5 1.0 2.0))))


(fun idx
		(* (line 
			(seq (~ tendency1) (~ tendency2))
			(st 1)) (table-cap mask1)))

(clone 
(step-gen
	(filter 
		(* amp (list-walk table
			(seq
				(latch (st 1) (index mask1 idx))
				(latch (st -1) (index mask1 idx))))))
	(st 1)
	:pan (rvfi -1 1)
	) 5)