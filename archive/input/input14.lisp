(step-gen
(+ 
	(
		(* (cycle (st 440)) 0.1)
		(delay 
			(audioIn 0) 
			44100 
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (ch (/ 2.0 3.0) (/ 3.0 2.0))) (st 1.0) (st 16))))
	)
)
(st 1))