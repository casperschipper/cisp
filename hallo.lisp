(fun freqStep
	(line
		(ch (seq -100 -333 true) -1 (seq (latch (st -10) (st 10)) -3033 true) -200 -300 (seq 10 200 30 true))
		(t 
			(rv 1 4) 
			(ch 1 2 4))))

(fun panStep
	(line
		(ch -1.0 -0.1 0.001 0.1 (t (rv -1 1) (ch 0.1 0.001 0.1 1.0)))
		(t 
			(ch 1 2 4) 
			(ch 1 2 4))))

(sci2 
	simpleSine
	(t (ch 0.01 0.02 0.001 (rv 0.1 1.0)) (ch 1 2 3))
	:freq (bounded-walk (st 20) (t (rv 10 20000) 1) freqStep)
	:duration (line (ch 0.1 0.01 0.05 0.2 0.01 5.0) (ch 0.1 0.2 0.4 0.8 1.6))
	:pan (bounded-walk -1 1 panStep)
	)