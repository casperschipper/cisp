(~ loopSize
	(t
		(ch 4 6 18)
		(ch 0.5 1 2)))

(~ loopAmount
	(t
		(ch 2 3 5)
		(ch 0.5 1 2)))

(# freqTable (fillf 2 1000 12000))

(fun a
	(seq freqTable))

(procedure replaceFreqs
	(replacef freqTable (fillf 2 1000 12000)))

(schedule replaceFreqs
	(rv 1 2))

(fun loopa
	(loop a (~ loopAmount) (~ loopSize)))

(fun starts
	(seq loopa loopa loopa))

(fun ends
	(seq loopa loopa loopa))

(fun nSteps
	(* loopa (t
		(ch 0.1 0.01 0.002)
		(ch 13 17))))

(fun slower
	(t
		(ch 8 4 3 16)
		(ch 0.5 13 15)))

(step-gen
	(cycle 
		(seq
			(tlatch 
				(linseg starts ends nSteps 1) (ch 0.5 1 1.5))
			(tlatch
				(linseg starts ends (* nSteps slower)) (ch 0.5 1 1.5))
			(tlatch
				(+ 
					(linseg starts ends (* nSteps 128)) (* (cycle 15) 500))
			(ch 0.5 0 1.5 2.5))
					))
	(st 1)
	)