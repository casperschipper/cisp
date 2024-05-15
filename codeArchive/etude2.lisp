(fun time1
	(hold
		(bounded-mup-walk (st 1) (st 10) (ch 1 2 0.5 1.5 0.6666667))
		(ch 10 200 3000 5000 10000 15000)))

(fun slow
	(line
		(seq -1 1)
		(ch 0.1 10 15 12)))

(# mem2 (alloc 2048))

(samp-schedule
	(write 
		mem2
		(wr mem1 
		(lookup OSC.table2 (+ (rd mem1) slow)))
		(count2 (table-cap mem2)))
	(st 1))



(fun filter (in)
	(biquad in 1 (st 1000) 1.5 1.0))


(step-gen
	(+ (loop 
		(wr mem1 
		(filter (lookup OSC.table2 (+ (rd mem1) slow))))
		(ch (grow 1 2 12)) (ch 1 30 100)) 
	(list-walk mem2 (hold (seq -1 1) (line (seq 1 1000) (ch .1 .3 .5 1 2 5)))))
	time1
	:pan (rvfi -1 1)) 