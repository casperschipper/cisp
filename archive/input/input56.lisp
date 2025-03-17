(step-gen
(+ 
	(
		
		(delay 
			(audioIn 0) 
			44100
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (/ (ch 1 2 3 4 5 6 7 8) (ch 1 3 5 7 11 13 17 23))) (st 1.0) (st 10))))
	)
)
(st 1))

(step-gen
(+ 
	(
		(delay 
			(audioIn 0) 
			441000
			(line 
				(ch 0 44100) 
				(ch 10 0.0001 40)))
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
				(ch 0 44100) 
				(ch 1 2 8 10 20 30 40))
	)
)
(st 1)
:pan (rvfi -1 1))


