(midi-note-channel
	(index 
		(list 
			0.004
			0.01 
			0.02
			0.05
			0.1)
		(line (seq 0 5) 
			(fractRandTimer (ch 0.001 0.2 0.3 ))))
	(seq 
		(hold (seq (rv 0 128) (* (ch 0 8) 12)) (hold (seq 1 17) (st 11)))
		(hold (seq (rv 0 128) (bounded-walk 0 127 (ch -7 7))) (hold (seq 1 130) (st 11))) 
		(hold (seq (rv 110 128) (rv 0 30)) (hold (seq 1 11) (st 11))))
	(index 
		(list 
			0.01 0.2 0.3 1.0 10.0)
		(line (seq 0 5) 
			(fractRandTimer (ch 0.001 0.2 0.3 ))))
	(st 100)
	(st 1.0))