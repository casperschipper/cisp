(~ loopSize
	(t
		(ch 4 6 18)
		(ch 0.5 1 2)))

(~ loopAmount
	(t
		(ch 2 3 5)
		(ch 0.5 1 2)))

(~ ctrlFreq
	(rv .11 .31))

(~ topper
	(t 
		(seq (ch 8000 20000) (rv 1000 8000) 18000)
		(ch .3 .7 1.5)))

(fun freq 
	(t
		(seq (* 100 (+ 1 (seq (steno "shgdchjsdbchjbdcabucayerifberijinrejvoniafjbnvorjnvojnavnovirneojnvsfjvsjrnvjhdfbhvajbbjdaaaaaaabsjdbfjsadhbvjafhdbvuareyvbrhbvadhfdvfbvbbbbb")))))
		(~ ctrlFreq)))

(fun a
	(seq freq freq freq freq freq freq freq freq freq freq freq freq freq freq freq freq freq))

(fun loopa
	(loop a (~ loopAmount) (~ loopSize)))

(fun starts
	(seq loopa loopa loopa))

(fun ends
	(seq loopa loopa loopa))

(fun nSteps
	(* loopa (t
		(ch 0.1 0.01 0.001)
		(ch 13 17))))

(fun slower
	(t
		(ch 8 4 3 16)
		(ch 0.5 13 15)))

(step-gen
	(cycle 
		(seq
			(tlatch 
				(linseg starts ends nSteps 1) (ch 5 7))
			(tlatch
				(linseg starts ends (* nSteps slower)) (ch 0.5 1 1.5))
			(tlatch
				(+ 
					(linseg starts ends (* nSteps 128)) (* (cycle 15) 500))
			(ch 0.5 0 1.5 2.5))
					))
	(t (seq 1 2 3) (t (ch 0.1 0.2 0.3) (ch 0.1 0.2 0.5 1.0))))