(~ inputsig
	(clip 
		(* 
			(+
				(audioIn 0)
				(audioIn 2)
			) 80)
		-1 1))

(# table
	(alloc 51000))
	
(samp-schedule
	(write table (~ inputsig) (count (table-cap table)))
	(st 1))

(fun filter (input)
	(biquad input 1 (rvfi 100 9000) 5 100.0))

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
		(/ 1.0 (rf -40 88))
		(fractRandTimer (ch 0.01 0.1 0.5 1.0 2.0))))


(fun idx
		(* (line 
			(seq (~ tendency1) (~ tendency2))
			(st 0.25)) (table-cap mask1)))

(test idx)

(clone 
(step-pan-gen
	(filter 
		(index-lin table
			(bounded-walk (st 0) (table-cap table) 
				(seq
					(latch (t (bounded-mup-walk 0.01 4 (ch 0.66667 1.5 2.0 0.5)) (ch 0.7 2.0 3.5)) (index mask1 idx))
					(latch (st -0.1) (index mask1 idx))))))
	(st 1)
	(line (seq -1 1) (ch 3 4 6))
	) 3)