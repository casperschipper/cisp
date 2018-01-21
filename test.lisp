(step-gen
(seq (fillf 8 -.1 .1))
(index (1 (ch 1 20 40 200) 20 (hold (seq 7 8 1 120 2 30) (st 100)) 40)
	(loop (walk 0 (seq 1 2 1 (seq 1 2 3 2 1 2 1 1 1 2) 3 2 1 3)) (seq 10 20 30 40) (st 2))))