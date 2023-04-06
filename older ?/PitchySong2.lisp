(fun walky
	(t (bounded-walk 10 30 (ch (rv -10 -9) (rv 10 10)))
		(ch 1 2 4 8)))

(clone
(step-pan-gen
(seq (latch (st 1) 8) (latch (st -1) 8))
(t (index (list walky walky walky walky) (loop (series (0 1 2 3)) (st 8) (st 2))) (fractRandTimer (ch 0.001 .1 .2 .4 .8 1.6) ))
(t (seq (fillf 8 -1 1)) (fractRandTimer 0.001)))
1)