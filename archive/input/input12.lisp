(step-gen
(+ 
	((delay (audioIn 0) 44100 (line (seq 0 44100) (ch 0.5 1.0 1.5)))
	(delay (audioIn 0) 44100 (line (seq 0 44100) (ch 0.5 1.0 1.5)))
	(delay (audioIn 0) 44100 (line (seq 0 44100) (ch 0.5 1.0 1.5)))))
(st 1))