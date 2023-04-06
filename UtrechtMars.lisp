(# timers (1.0 2 4 8 6 22 0.001 0.1 0.2 0.3))
(# panTable (sine 32 (list 1.0)))

(procedure update
	(# timers
		(collect (ch (rv 0.001 0.004) (rv 0.05 0.3) (rv 1 7)) 9)))

(procedure update2
	(# panTable
		(fillf 32 -1 1)))

(procedure update3
	(# panTable
		(sine 32 (collect (rv -0.5 0.5) 4))))

(schedule (ch update update2 update3) (ch 0.5 1. 3. 5 11))

(fun sr
	(index
		(list 
			(rv 0 1) (line (seq 0.001 0.1) (ch 0.001 0.2 0.3 0.4)) 0.01 0.001 0.003)
		(t (rv 0 6) (ch 7 14 21))))

(fun aa 
	(line (seq 0 (table-cap timers))
		(ch 7 11 17)))


(fun a 
	(line
		(seq 0 (table-cap timers))
		(line (seq a a) sr )))



(fun stepi
	(index timers (line (seq aa aa) sr)))

(pulse-pan-gen
	(index-lin
		(fillf 32 -1 1) (bounded-walk 0 32 stepi))
	(st 1)
	(index-lin
		panTable (bounded-walk 0 32 stepi)))



