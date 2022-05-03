(fun fractal (str)
	(t 
		(t
			str str
		) str
		))

(fun 
	aa
	(line
		(seq 0 128)
		(st 7)))

(fun 
	bb
	(line
		(seq 0 128)
		(st 5)))

(fun loopsize
	(ch 2 4 8 16 32 128))

(fun looptimes (ch 4 8 16))

(fun a
	(line 
		(seq aa bb)
		(fractal (ch 0.001 0.2 0.3 0.5 (rv 0.001 0.0001)))))

(step-pan-gen
	(cycle 
		(loop (index
			(fillf 128 10 20000)
			a) loopsize looptimes) )
	(st 1)
	(t (hold (seq -1 1) (ch 1 1 1 1 1 1 1 1 2))
		(fractal (ch 0.001 (rv 0.1 0.5) (rv 1 3)))))