(# timy (fillf 128 1.0 77))

(procedure casper
	(# timy
		(collect
			(seq 
				(latch
					(rv 1 15)
					(rv 1 8)
					)
				(latch
					(rv 15 20)
					(rv 1 3)
					)
				(latch
					(rv 1 3)
					(ch 1 7 20)
					)
				(latch 
					(ch (hold (rv 1 3) (st 100)) (rv 1 3))
					(ch 1 3 2 2 2 2 2 4 8)))
			128)))

(schedule
	casper
	(t (ch 1 2 5 8 12) (ch 1 3 6 8 12)))

(fun a
	(line
		(seq 0 (table-cap timy))
		(ch 5. 7 32 2 0.01)))

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
		(ch 1 2 5 8 12 16))))


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
		(t (rv 1 10) (ch 1 2 4 7 11 17 29))
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
