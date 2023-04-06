(#  
	record (fillf 44100 0.0 0))

(samp-schedule 
	(write record (clip (* (audioIn 0) 1) -1 1) (count (table-cap record)))
	(st 1)
	)


(fun bah
	(statemachine (list 
		(weights ((st 1) (st 100)) ((rv 0 4) (st 1)))
		(weights ((st 2) (st 100)) ((rv 0 4) (st 1)))
		(weights ((st 3) (st 100)) ((rv 0 4) (st 1)))
		(weights ((st 4) (st 100)) ((rv 0 4) (st 1)))
		(weights ((st 0) (st 100)) ((rv 0 4) (st 1)))
		)))


(fun a 
	(t (ch 1 50 128 64 10 10000) (fractRandTimer (ch 0.001 0.1 0.2 0.4 1.6 3.2))))

(clone 
(step-pan-gen
	 (index 
	 	(list 
			(latch (index-lin record (bounded-walk (st 0) (* (table-cap record) 0.1) (line (seq 0 1) (rv 0 3)))) a)
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (line (rv 1 10) (rv 0 3)))) a)
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (line (rv 3 4) (rv 0 3)))) a)
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (line (rv 1.01 1.01) (rv 0 3)))) a)
			(latch (index-lin record (bounded-walk (st 0) (table-cap record) (line (rv 0 109) (rv 0 400)))) a)
			
		 )
	 bah)
	(st 1)
	(t (rv -1 1) (rv 3 9))
	)
6)

