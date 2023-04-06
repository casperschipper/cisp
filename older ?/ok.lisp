(fun fifty
	(line (ch 100 1 7 5 20 40 1000) (ch 0.1 0.001 0.01 0.1 0.4 1.0)))

(clone
(step-gen
(seq -.1 .1)
(index (list fifty fifty) 
	(t (bounded-walk 0 4 (hold (seq -1 1) (rv 4 6))) (st 0.01)))
:pan (rvfi -1 1))
4 )
