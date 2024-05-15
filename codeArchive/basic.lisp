(samp-schedule
	(write 
		OSC.table1
		(line
			(seq -1 1)
			(ch 0.001 0.03 0.1))
		(count 128))
	(line (seq 10 100) (ch 0.1 0.5 1.0)))

(fun top
	(t 
		(rv 0 6)
		(ch 1 2 5)
		))

(fun step
	(hold
		(ch -1 1)
		(index 
			(1 2 10 50 100 200)
			(line
				(seq top top)
				(ch 0.1 0.4 0.01)))))

(step-gen
	(list-walk OSC.table1 step)
	(st 1)
	:pan (rvfi -1 1))


