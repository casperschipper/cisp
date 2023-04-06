(fun pitch
	(hold 
		(seq 440 110 220 330 550 1100 222)
		(ch 1 2)))

(sci2
	saw
	(st 0.1)
	:freq (seq pitch pitch))