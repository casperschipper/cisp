(fun foo
	(t (seq 0.01 0.02 0.04)
		(rv 5 7)))

(clone
(step-gen 
(seq 
	(tlatch (st -1) (st foo))
	(tlatch (st 1) (st foo))
	(latch (* (ch -1 1) (ch -1 1)) (rv 2 3))
	) 
(st 1)
:pan (rvfi -1 1))
4)