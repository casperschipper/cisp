(fun a
	(line
		(ch 0 1 2 10)
		(ch 0.1 1 2 8)))

(clone
(step-gen
	(index (list -1 1) (% (line (seq 0 a) (st 0.01)) 2))
	(st 1)
	:pan (rvfi -1 1))
4)