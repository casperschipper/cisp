(fun top
	(line 
		(seq 0.01 3.0)
	(ch 2.0 3.0 4.0)))

(fun 
	harm
	(t 
		(ch 1 4 0.1 8)
		(ch 0.1 0.2)))


(sci2
	simple
	(line (ch 0.01 0.1) (ch 3 7 9))
	:freq (* (st 400) (/ harm harm))
	:amp (st 0.03)
	:dur (line (seq 6.0) (ch 0.1 0.3 1.0 5.0))

	:pos (line (seq -1 1) (fractRandTimer (ch 0.01 0.1 0.2 0.3 1.0 4.0)))
)