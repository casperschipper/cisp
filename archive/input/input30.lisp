(step-gen
(+ 
	(
	
		(delay 
			(audioIn 0) 
			44100
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (rv 0. 2.0)) (st 1.0) (st 100))))
	)
)
(st 1))

