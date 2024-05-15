(fun a
	(line
		(seq (bounded-walk 0 10 (ch -1 1)) 128)
		(t
			(ch 0.001 0.01 0.1 0.2 0.3 0.5 5 10)
			(ch 0.01 0.1 0.2 0.3 0.5))))

(fun freq
	(t
		(bounded-mup-walk 200 1200 (ch 0.75 1.5))

		(ch 0.14)))

(fun amp
	(index-lin 
		OSC.table1
		(line (seq a a) (/ 1.0 
			freq ))))

(step-gen amp (st 1))