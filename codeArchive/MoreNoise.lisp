(fun filter (input)
	(biquad input 1 (rvfi 100 4000) 1 200.0))


(fun steppy
	(seq
		(latch (ch -.1 .1) (ch 1 3 5 10))
		(latch (ch -2 0 10 3) (ch 1 30 10))
		(latch (rv -10 10) (rv 1 10))
		(latch 
			(loop 
				(rv -10 10)
				(rv 1 10)
				(rv 1 10)) (rv 1 10))))

(fun f 
	(bounded-walk (st -1) (st 1) (* steppy 0.0001)))

(# noisy 
	(collect f 44100))




(# entry
	(collect 
		(bounded-walk (st 1) (st 10000) 
			(bounded-walk (st -100) (st 100) steppy)) 80))

(fun tend1
	(line
		(seq 0 1)
		(ch .3 .7 .5 .4)))

(fun tend2
	(line
		(seq 0 1)
		(ch .1 .7 .2 .4)))

(fun tendencyMask
	(index entry
		(rv 
			(* tend1 (table-cap entry))
			(* tend2 (table-cap entry))
			)
		))


(clone
(step-pan-gen
		(index-lin noisy
			(bounded-walk (st 0) (table-cap noisy)
				(seq
					(latch (st 1) tendencyMask)
					(latch (st -1000) (st 1))
				)))

	(st 1)
	(line (rv -1 1) (ch 0 1 0.3 0.5 1.0 ))
) 2)