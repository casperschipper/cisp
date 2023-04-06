(fun freq
	(mtof
		(+ 60 (latch (floor (reset (walk 0 (loop (ch 2 4 5 7 -7) (st 4) (st 3))) (st 0) (st 10))) (st 12)))))

(fun loopit (it)
	(loop it (rv 3 4) (rv 3 5)))

(fun env
	(timed-reset )
	(mup-walk 1 (st 0.99))
	(st 1)
	(st 0.14))

(step-gen
	(* env 
		(biquad (waveosc OSC.table1 (t (/ 1 (seq 
		(loopit freq)
		(loopit freq)
		(loopit freq) )
		) 0.14)) 0 1000 1.99 1.0))

	(st 1))

