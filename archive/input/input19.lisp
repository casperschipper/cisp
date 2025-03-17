(step-gen
(+ 
	(
	
		(delay 
			(audioIn 0) 
			44100 
			(line 
				(seq 0 441) 
				(reset (mup-walk 1.0 (ch (/ 2.0 3.0) (/ 3.0 2.0))) (st 1.0) (rv 5 17))))
	)
)
(st 1))

(step-gen
	(delay 
			(audioIn 0) 
			44100 
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (ch (/ 2.0 3.0) (/ 3.0 2.0))) (st 1.0) (rv 1 16))))
	(st 1)
	:pan (rvfi -1 1))

(step-gen
	(delay 
			(audioIn 0) 
			44100 
			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (ch (/ 2.0 3.0) (/ 3.0 2.0))) (st 1.0) (rv 1 16))))
	(st 1)
	:pan (rvfi -1 1))