(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rf 1 3)) (rf 1 10))
		(latch (st 0) (rv 1 200)))
	)

(# table1 
	(collect
		myPulse
		30))

(# recording1
	(fillf 441000 0 0))

(~ topspeed
	(line
		(hold (/
			(st 1.0)
			(rf -10 5000)) (st 2))
		(fractRandTimer (ch 0.01 0.03 0.1 0.5 3.0))))

(fun indexer
	(bounded-walk (st 0) (table-cap table1)
		(reset 
			(bounded-walk -100.0 100.0 (ch (* -1.0 (~ topspeed)) (~ topspeed)))
			(rv 1.0 1.0)
			(rv 1 1000000))))


(clone
(step-gen
	(writeover 
		recording1 
		(index-lin table1 indexer) 
		(count (table-cap recording1))
		(st 0.5))
	(st 1)
	:pan 0)
1)

(~ myFun
	(t (ch 0.25 1.5 3 4.5 9) (ch 3 6 11 23)))

(~ myFun2
	(t (ch 1.5 3 4.5 9) (ch 3 6 11 23)))

(clone 
(step-gen
	(* (writeover 
		recording1 
		(* (index-lin recording1 (line (rv 0 441000) (ch 3 4 5 ))) 2)
		(count (table-cap recording1))
		(st 0.1)) 1)
	(st 1)
	:pan (rvi 0 1))
6)