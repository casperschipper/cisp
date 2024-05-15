/* lets make a function that creates freqs */


(fun topf
	(hold
		(seq 400 5000 12000 2000 (ch 30 50 100))
		(hold (seq 1 3 4 5 2) (seq 1 2 2 1 (ch 1 2)))))

(fun bottomf
	(hold
		(seq (ch 50 100 80) 200 500 1000 4000)
		(hold (seq 3 2 5 1) (seq 1 3 2 1 (ch 2 1)))))


(fun len
	(hold
		(loop (seq 1 2 5 10 20 100) (ch 3 4 10 23) (ch 3 4 10 20))
		(hold (seq 1 20 3 4) (seq 3 2 1 2))))


(fun sometimesLong
	(sometimes (exprv 10 40 5) len 10))

(fun loopi (arg)
	(loop arg (ch 3 4 6 10) (ch 3 4 6 10)))

(fun foo
	(hold
		(seq 4410 4410 4410 441)
		(ch 10 30 40 400)))

(fun mapper (arg)
	(linlin arg (st 20) (st 20000) (st 20) (line (seq 20 12000) (ch .1 .5 1. 2.))))

(fun freqs
	(/ foo (linseg (mapper (loopi topf)) (mapper (loopi bottomf)) sometimesLong true))
	)



(fun loopSize
	(t
		(loop (rv 1 (~ topLoops)) (rv 1 30) (rv 1 10))
		(fractRandTimer (ch 0.01 0.1 0.5 0.8 1 2 4))))

(clone 
(step-pan-gen
	(loop (sineseg freqs) loopSize loopSize) /* amplitude */
	(st 1)
	(loop (sineseg freqs) loopSize loopSize)) 3) /* time in samples */