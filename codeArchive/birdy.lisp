(fun transS
	(t
		(ch 1.0 2 0.5 1.5 0.666666667)
		(ch 2 3 5 7)))

(fun trans
	(seq transS transS))

(fun pitch
	(hold 
		(* (seq 100 200 175 192 96 48) trans)
		(index 
			(4 2 1 1 2 4 7) 
			(hold (count 7) (weights ((1 100) (2 10)))))))

(fun onePan
	(t
		(rv -1 1)
		(ch 1 2 5 7)))

(clone
	(sci2
		saw
		(* (seq 0.12 0.1) 1.0)
		:duration (line (seq 0.5 0.1) (seq 5 7 2 14))
		:freq (* (seq pitch pitch) (rv 0.999 1.001))
		:pos (seq onePan onePan))
	1)