(# timy
	(1. 4 7 23 22 1 17 3 4 2 1 2 3 2 3 4 5 55 44 13 17 330 220 512 128 1 4 512 430))

(procedure casper
	(# timy
		(collect
			(seq 
				(latch
					(rv 1 22)
					(rv 1 4)
					)
				(latch
					(rv 70 130)
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
	(ch .5 .1 1 2 10))

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
			(rv a a))
	(t
		(count 2)
		(rv 0 5))))


(clone 
(pulse-fb-gen
	(index
		(list
			(seq  -1 1)
			(rv -1 1)
			(seq (fillf 32 -1 1))
			)
		(t (count 3) (ch 1 2 3 4 5 6)))
	(index timy reader)
	(index (fillf 32 -1 1) reader)
	(mtof (index (fillf 32 -20 90) reader))
	(index OSC.table1 reader))
1)
