(fun holder 
	(input) 
	(hold input 
		(seq
		(latch (st 1) (rv 9 100))
		(latch (rv 1 200) (st 1)))))

(fun casper (guardedWalk
		100.0 (
			(guardTest (> 15000) (overwrite (st 10000)))
			(guardTest (< 1.0) (overwrite (st 10000)))
			(guardControl (holder (seq 0 1)) (+ 1))
			(guardControl (holder (seq 0 1)) (* 2))
			(guard (* (holder (seq 0.5 1.5)))))))

(step-pan-gen
	(seq (sine 32 
		(collect (mup-walk 1.0 (st 0.95)) 100)))
	(/ 44100 (t casper 0.001))
	(line
		(holder (seq (fillf 32 -1 1)))
		(holder (seq (0.001 1)))))
