(fun myPulse
	(seq 
		(latch (hold (rv -1 1) (rf 5 500)) (rf 5 10))
		(latch (st 0) (rv 5 20)))
	)

(# table1 
	(collect
		myPulse
		1000000))

(# recording1
	(fillf 441000 0 0))

(~ topspeed
	(line
		(st 0.00001)
		(fractRandTimer (ch 0.01 0.03 0.1 0.5 3.0))))

(fun indexer
	(bounded-walk (st 0) (table-cap table1)
		(reset 
			(bounded-walk -1.0 1.0 (ch (* -1.0 (~ topspeed)) (~ topspeed)))
			(rv 1.0 1.0)
			(rv 1 1000000))))


(clone
(step-gen
	(writeover 
		recording1 
		(index-lin table1 indexer) 
		(count (table-cap recording1))
		(st 0.9))
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
		(* (index-lin recording1 (line (seq 0 (rv 0 441000)) (ch 0.001 0.002 0.001 0.003 0.0045 0.02232 0.02 0.00003 0.1 0.2 (rv 1 3)) )) 2)
		(count (table-cap recording1))
		(st 0.1)) 1)
	(st 1)
	:pan (rvi 0 1))
4)