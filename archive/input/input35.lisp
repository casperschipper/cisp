(step-gen
(+ 
	(
		(* 0.1 (cycle (st 338)))
		(delay 
			(audioIn 0) 
			44100
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (rv 0.5 2.0)) (st 1.0) (st 10))))
	)
)
(st 1))

