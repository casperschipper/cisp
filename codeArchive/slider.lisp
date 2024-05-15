(sync 0.14)


(sci2 
	pulse
	(line (seq 0.001 0.1 0.01) (ch 0.1 1 2))
	:freq (hold 
		(mtof (seq 
		(+ (slider 1) (seq (slider 4) (slider 5) (slider 6)))
		(slider 2)
		(slider 3)))
		(ch 1 1 1 1 1 1 1 1 2))
	:duration (line (seq 0.001 0.1 0.01 0.5) (ch 0.1 1 2))
	:pan (t (rv -1 1) (fractRandTimer (ch 0.001 0.1 0.2 0.4 0.5)))
		)
