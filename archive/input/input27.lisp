(step-gen
(+ 
	(
	
		(delay 
			(audioIn 0) 
			44100
			(line 
				(seq 0 44100) 
				(mup-walk 1.0 (ch 0.5 2.0))))
	)
)
(st 1))

