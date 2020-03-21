(fun wl2
	(t 
		(/ 1 (ch 1 3 5 7 0.5 0.3333 0.75 0.8 0.4))
			(ch 1 3 5 7)))

(~ wlIndex
	(t
		(line 0 8)
	 	100))

(fun offset
	(t 
		(loop (rv 0 4) (st 3) (st 1000))
		(loop (ch 1 2 3) (st 3) (st 1000))))

(fun wl
	(/
		1
		(* 100 
			(index 
				(1 2 3 0.5 4 5 6 0.25)
				(+ (~ wlIndex) offset)
				))))

(clone
(step-gen
	(index-lin OSC.table1 
		(+ 
			(line 
			(seq 0 128) 
			(t wl (ch 1 3 5 7 11))
			)
			(line (seq 0 16) wl2)))
	(st 1)
	:pan (rvfi -1 1))
3)