(step-gen
(+ 
	(
		(* 0.1 (cycle (st 338)))
		(delay 
			(audioIn 0) 
			44100
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (/ (ch 1 2 3 4 5 6 7 8) (ch 1 2 3 4 5 6 7 8))) (st 1.0) (st 10))))
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
				(ch 0.0001 1.0 2.0)))
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
				(ch 0.1 0.9 2.0 8.0))
	)
)
(st 1)
:pan (rvfi -1 1))


