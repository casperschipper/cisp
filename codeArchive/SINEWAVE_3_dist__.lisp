


(# mytab
	(collect (bounded-mup-walk 110 1000 (ch 0.5 2.0)) 8))

(fun la
	(line (ch 0.0 0.0 0.0 0.001 2 10 1 1000) (ch 1 3 7 11)))

(samp-schedule
	(write mytab (bounded-walk 500 15000 (ch (* -1 la) la)) (count (table-cap mytab)))
	(st 4000))

(fun clocker
	(fractRandTimer
		(ch 0.001 0.02 0.03 2.0)))

/*
(clone 
(step-gen
	(cycle (t (list-walk mytab (hold (seq -1 1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 3 4))) (hold (seq clocker clocker) (ch 3 6 9) )))
	(st 1.0)
	:pan (rvfi 0 1))
20)*/


(sci2
	sin
	(st 0.1)
	:freq (ch mytab)

	:amp (st 0.1)
	:dur (ch 3.0)
	:pos (bounded-walk -1 1 (ch -0.1 0.1)))


