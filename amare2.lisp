// this will execute this function each n samples

(fun amount
	(line (seq 0.001 0.1)
		(ch 1 2 3 5)))

(samp-schedule
	(write OSC.table1 (bounded-walk -1 1 (hold (rv (* -1 amount) amount) (rv 40 10))) (count (table-cap OSC.table1)))
	(rv 300 40000)
	)


(fun a
	(line
		(rv 0 128)
		(ch 0.001 0.1 0.2 0.5 1.0 2.0)))

(clone 
(step-gen
(index-lin OSC.table1 (line (seq a a) (ch 0.0015)))
(st 1)
:pan (rvfi -1 1))
2)