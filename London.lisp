(clone
	(sci2 ping 
	(st 0.14)
	:freq 
	(loop
		(* 100 
			(+ (hold (seq 1 2 3 2) (seq 1 2 3))
				(latch (seq 1 2 (seq 2.5 4 1.5 5 7) 2) (st 4) )))
		(ch (seq 1 1 1 1 1 1 1 1 1 1.5 2 1.5 2) 2 3 2)
		(ch 1 2 3 2))
	:duration (* (hold (seq 1 2 3) (seq 1 2 3)) 
		(hold (seq 0.1 0.2 0.3) (seq 1 2 3)))
	:amp (st 1.0)
	:filter (line (seq 100 5000) (ch 10 15 20))
	:pan (st (rvfi -1 1))

	)
3)