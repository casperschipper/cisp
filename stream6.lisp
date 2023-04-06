(#  
	record (fillf 441000 0.0 0))

(samp-schedule 
	(write record (clip (* (audioIn 0) 10) -1 1) (count (table-cap record)))
	(st 1)
	)


(fun bah
	(statemachine (list 
		(hold (seq 1 0) (rv 1 1000))
		(st 2)
		(st 3)
		(st 4)
		(st 0)
		)))

(step-gen
	(seq record)
	(st 1))

(clone 
(step-pan-gen
	 (index 
	 	(list 
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (st 1))) (st 4410))
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (st 1))) (st 4410))
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (st 1))) (st 4410))
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (st 1))) (st 4410))
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (st 1))) (st 4410))
			
		 )
	 bah)
	(st 1)
	(st 1)
	)
6)

