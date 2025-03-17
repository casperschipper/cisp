(step-gen
(+ 
	(
		
		(delay 
			(audioIn 0) 
			44100

			(line 
				(series 0 44100 4410) 
				(reset (mup-walk 1.0 (/ (ch 1 2 3 4 5 6 7 8) (ch 1 3 5 7 11 13 17 23))) (st 1.0) (st 30))))
	)
)
(st 1))

(step-gen
(+ 
	(
		
		(delay 
			(audioIn 0) 
			44100
			
			(line 
				(series 0 10 44100) 
				(reset (mup-walk 1.0 (/ (ch 1 2 3 4 5 6 7 8) (ch 1 3 5 7 11 13 17 23))) (st 1.0) (st 30))))
	)
)
(st 1))

(step-gen
(+ 
	(
		(delay 
			(audioIn 0) 
			44100
			(line 
				(series 0 4410) 
				(ch 1 2 0.5 (rv 0.001 0.01))))
	)
)
(st 1)
:pan (rvfi -1 1))

(step-gen
(+ 
	(
		(delay 
			(audioIn 0) 
			441000
			(line 
				(series 0 44100) 
				(c 1 2 0.5 (rv 0.001 0.01)))
	)
)
(st 1)
:pan (rvfi -1 1))


