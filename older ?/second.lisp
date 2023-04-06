(# table (collect
			(rv -1 1) 200))

(procedure repro
	(# table (collect (rv -1 1) (rvi 3 100))))

(schedule repro (fractRandTimer (ch 0.1 1 2)))

(fun sizy
	(t 
		(ch 100 1000 512)
		(ch 0.1 0.2 0.5 1.0 2.0)))


(clone

(pulse-gen
	(seq 
		(latch (index table (count 100)) sizy)
		(latch 0 (weights ((40 1000) (405 1) (10 10)))))
	(st 1)
	:pan (rvfi -1 1)
	) 
3)