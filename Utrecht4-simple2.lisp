(# timy
	(1. 4 7 23 22 1 17 3 4 2 1 2 3 2 3 4 5 55 44 13 17 330 220 512 128 1 4 512 430))

(procedure casper
	(# timy
		(collect
			(seq 
				(latch
					(rv 1 15)
					(rv 1 8)
					)
				(latch
					(ch 20 22 44)
					(rv 1 7)
					)
				(latch
					(rv 20 2000)
					(ch 1 7 20)
					)
				(latch 
					(ch (hold (rv 1 50) (st 100)) (rv 1 40))
					(ch 1 3 2 2 2 2 2 4 8)))
			16)))

(schedule
	casper
	(ch 2 4 8))

(fun a
	(line
		(seq 0 (table-cap timy))
		(ch 5. 7 2 0.01)))

(fun sr
	(*
	(t
		(ch 0.001 0.01 0.0001 2)
		(ch 0.001 0.1 0.2 0.6 ))
	(t
		(ch 0.75 1.5 0.5 3 4)
		(ch 1 2 5))))

(fun reader
	(index
		(list
			(line (seq a a) sr)
			(bounded-walk a a (ch -.01 .01)))
	(t
		(count 2)
		(rv 0 5))))


(clone 
(step-pan-gen
	(index-lin
		(list
			(seq  -1 1)
			(rv -1 1)
			(seq (fillf 32 -1 1))
			(seq OSC.table1)
			(seq OSC.table2)
			(seq OSC.table3)
			)
		reader)
	(index-lin (list
		(index timy reader)
		(t (rv 1 1000) (ch 1 2 4 7 11 17 29))
		) (t (count 2) (ch 1 2 4 8 12)))

	(index-lin
		(list
			(seq  -1 1)
			(rv -1 1)
			(seq (fillf 32 -1 1))
			(seq OSC.table1)
			(seq OSC.table2)
			(seq OSC.table3)
			)
		reader))
1)
