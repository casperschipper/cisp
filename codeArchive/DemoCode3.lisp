(# table1 (fillf 8 -1 1))
(# table2 (fillf 8 1 20))

(fun top
	(t
		(seq  3)
		(t (ch 0.1 0.4 0.8) (ch 1 3 5))))

(fun updateFreq
	(line
		(rf -20 128)
		(ch 0.1 0.4 0.8 1.6)))

(~ writer
	(write table1 (rv -1 1) (count (table-cap table1))))

(~ writer2
	(write table2 (rv 1 top) (count (table-cap table1))))

(schedule 
	(seq (~ writer) (~ writer2))
	(/ 1.0 updateFreq))

(fun stepper
	(t
		(ch -1 1)
		(/ 1.0 updateFreq)))



(step-pan-gen
	(seq table1)
	(loop (list-walk table2 stepper)
		(st 4) updateFreq)
	(seq table1))