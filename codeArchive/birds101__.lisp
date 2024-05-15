(# mups (0.5 2.0 1.333333333 0.66666667 1.5))

(# mupsnow (0.6667 1.5))

(schedule
	(write mupsnow (ch mups) (seq 0 1))
		(st 2))


(fun a
	(reset (bounded-mup-walk (st 50) (st 19000) (ch mupsnow) 8000) (ch 400) (ch 40 50 100) ))


(# times (10. 20 40 50 100 1000 2000))


(fun tend
	(line 
		(seq 0 (table-cap times))
		(rv 7 11)))

(fun tim
	(t
		(index times
		(rv tend tend))
		(ch .1 .4 3 5)))

(fun filt (arg)
	(* (biquad arg 0 (* (avg (freqCount arg) 4) 10) 1.0 1.0) 40))

(fun loopn
	(t
		(seq 1 3 4 10 30 50)
		(ch 3 5 1)))

(fun loopsize
	(t
		(seq 3 20 1 4 8 )
		(ch 3 5 1)))

(fun ampi
	(/ 10 
		(mtof 
			(line
		(seq 0 68)
		(fractRandTimer (ch 0.01 0.1 0.3 0.6 1.0 2.0))))))


(# mem1 (alloc 44100))

(fun loopersize
	(t
		(bounded-mup-walk 20 2000 (ch 0.5 2.0 1.5 0.6667))
		(ch .5 2 1.5)))




(step-pan-gen
	

    ( * (write 
    	mem1
    	(loop (lookup OSC.table1 (* (cycle (hold a tim)) ampi)) loopn loopsize)
    	
    	(hold (count (table-cap mem1)) (sometimes 44100 1 10000))) 1)
	
	(st 1)
	(line (rv 0 1) (fractRandTimer (ch 0.2 0.9 1.0 2.0 4.0 8.0)))) // fractRandTimer

(fun holdem
	(line
		(hold (ch 1 20 30 40 4000 20000) (ch 3 1 1 1 1 10 400))
		(ch 1 3 5 10)))



(step-pan-gen
	
    (index-lin mem1 (bounded-walk (st 0) (table-cap mem1) (hold (ch -1 1) holdem)))
	
	(st 1)
	 (index-lin mem1 (bounded-walk (st 0) (table-cap mem1) (hold (ch -1 1) holdem))))
