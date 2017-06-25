(~ sampSelect
	(line 
		(ch 8 16 24 32 40 48 96 128 256 192)
		(t (ch 0.01 0.1 0.5 1.0) (ch 0.1 0.5 1.0 2.0 4.0))))

(fun pitchRange 
	(t 
		(ch 1 2 8 4 40)
		(ch .1 .2 .4 .8 1.6 3.2)))

(fun offset
	(t
		(ch -80 -60 -40 0 -100)
		(ch .1 .2 .4 .8 1.6 3.2)))

(clone
(step-gen 
(index OSC.table9 
	(bounded-walk (~ sampSelect) (+ (~ sampSelect) 64)
	(t 
		(mtof
			(+ 
				(* (list-walk OSC.table2 
				(list-walk OSC.table3 (ch -1 1))) pitchRange)
				offset) 
				
				)
		(st 0.01))))
(st 1)
)
1)