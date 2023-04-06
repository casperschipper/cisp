(# table2
	(fillf 441000 0 0))

(fun c 
	(ch 256 512 20 2000)
	(ch 0.1 0.5 1.0 0.7))

(fun a
	(line
		(seq 0 c)
		(t (ch 0.001 0.2 0.3 0.002 0.001) (ch 0.3 0.5 1.0 2.0))))


(step-gen
	(writeover 
		table2 
		(+ (index-lin table2 
			(+ (list a a (line (ch 5 10 200 (rv 3000 40000) 2000 410000) (ch (hold (ch 0.001 0.02 0.03 3 0.01 0.1) (st 60)) (hold (rv 0.1 0.2) (st 100))))))
			) (* 0.1 (cycle (st 14000))))
		(count (table-cap table2)) (st 0.5)
		(st 0.2))
	(st 1)
	:pan (rvfi 0.0 1.0)
	)