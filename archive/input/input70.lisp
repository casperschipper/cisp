(step-gen
(+ 
	(
		
		(delay 
			(audioIn 0) 
			44100

			(line 
				(series 0 44100) 
				(reset (mup-walk 1.0 (/ (ch 1 2 3 4 5 6 7 8) (ch 1 3 5 7 11 13 17 23))) (st 1.0) (st 30))))
	)
)
(st 1))

