(# table2
	(fillf 441000 0 0))

(fun c
	(line
	(ch 20 50 10 256 128)
	(ch 0.1 0.5 1.0 0.7)))

(fun a
	(line
		(seq 0 c)
		(t (bounded-mup-walk 0.01 2.0 (ch 0.66667 1.5)) (ch 0.3 0.5 1.0 2.0))))


(fun inputAmp
(line
	(seq 0.1 0.0 0.0)
	(seq 5.0 100.0)))

(step-pan-gen
	(writeover 
		table2 
		(+ (index-lin table2 
			(+ (list a (line (ch 5 10 200 (rv 3000 40000) 2000 410000) (ch (hold (ch 0.001 0.02 0.03 3 0.01 0.1 0.8 1.0 10.0) (st 60)) (hold (rv 0.1 0.2) (st 100))))))
			) (* inputAmp (hold (seq -1 1) (rv 90 100))))
		(count (table-cap table2)) (st 0.5)
		(st 0.2))
	(st 1)
	(line (seq 0 1) (fractRandTimer (ch 0.001 0.1 0.5 2.0 3.0 8.0)))
	)