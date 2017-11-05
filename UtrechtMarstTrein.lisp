(# timers (1.0 2 4 8 6 22 0.001 0.1 0.2 0.3))
(# panTable (sine 32 (list 1.0)))

(procedure update
	(# timers
		(collect (ch (rv 0.001 0.004) (rv 0.05 0.3) (rv 1 7) (rv 0.0001 0.0002)) 11)))

(procedure updateLow
	(# timers
		(collect (/ 1.0 (mtof (rf -160 40))) 11)))

(procedure update2
	(# panTable
		(fillf 32 -1 1)))

(procedure update3
	(# panTable
		(sine 32 (collect (rv -0.5 0.5) 3))))

(schedule (ch updateLow update update2 update3) (ch 0.5 1 3 7 11))

(fun sr
	(index
		(list 
			(rv 0 1) (line (rv 0.001 0.1) (rv 0.1 0.5)) (rv 0.01 0.1) (rv 0.0001 0.005))
		(t (rv 0 4) (ch 0.5 0.5 0.5 7 14 21))))

(fun aa 
	(line (seq 0 (table-cap timers))
		(ch 7 3 17)))


(fun a 
	(line
		(seq 0 (table-cap timers))
		(line (seq a a) sr )))

(fun noise
	(floor
	(*
		(line (seq 0 0 (ch 0.3333 0.5 1)) (ch 3 7 14))
		(rv 0 3))))


(fun stepi
	(index timers 
		(line (seq aa aa) sr)))

(pulse-pan-gen
	(index-lin
		(fillf 32 -1 1) (bounded-walk 0 32 (+ stepi noise)))
	(st 1)
	(index-lin
		panTable (bounded-walk 0 32 stepi)))



