(fun holder
	(t 
		(ch 1 3 7 200 (rv 1 3000) 50000)
		(fractRandTimer (ch 0.001 0.1 0.2 0.3)))
	)

(clone 
(line-gen
	(* (hold (exprv -1 1 10) holder) (seq -1 1))
	(ch 2
		(hold (ch 1 2 3 4 20) 
			(ch 10 2 300 1000)))
	:pan (rvfi -1 1))
4)