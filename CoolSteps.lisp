(step-gen
(bounded-walk (st -1) (st 1) 
	(hold (seq -0.1 0.1) 
		(hold (seq 1 3 1 1 3 1) 
			(hold (seq 1 2) (hold (seq 5 7) (seq 1 (seq (steno "abbababbbabbbbbbababbabbabababbbbbbbbbabababbababbaabaaaaababababab")) (seq 3 5 1 2) (seq 1 2 1 7 2 1 2)))))))
(st 1))

/* steps within an octave:
   if you reached a frequency higher than 2* then you need to map to some lower previous frequency.
   Within the octave you may do anythign.
   */