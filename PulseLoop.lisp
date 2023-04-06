(fun a
	(index (
		(line (seq 1 400) (ch 0.01 0.1 1))
		(line (seq 1 400) (ch 0.01 0.1 1)) 
	) (hold (seq 0 1) (t (rv 1 100) (rv 0 3)))))

(step-gen
(seq 
	(latch (seq -1 1) (ch a a))
	(latch (seq -1 1) (st 1)))
(st 1) :pan (rvfi -1 1))

