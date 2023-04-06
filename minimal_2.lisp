(# mem (list 0.))
// this is just a cell to keep last position

(# spikes
	(collect
	  (/ 1.0 (rf 1.0 100)) 441000))

(# bulps
	(collect
	  (hold 
	  	(/ 1.0 (rf 1.0 10))
	  	(rv 1 30)) 100000))



// let's go!
(samp-schedule 
	(write mem 
			(index 
				(list 
					(hold (ch 0 4) (rv 0 700)) // 0
					(hold (ch 0 1 2) (rv 0 800)) // 1
					(hold (ch 0 3) (rv 33 9)) // 2
					(hold (ch 0 0 0 0 0 4) (rv 33 1)) // 3
					(hold (ch 0 1 2 3 4) (rv 33 10000))) // 4
			(seq mem))
		(st 0)
		)
	(st 1))

(step-gen
	(index
		( 
			(seq bulps :max 128 true)
			(seq bulps true)
			(seq (sine (rvi 0 1000) (fillf 64 -1 1)) true)
			(seq (fillf 16 -1 1) true)
			(seq bulps true)
		)
		(seq mem))
	(st 1)
	:pan (rvfi 0 1))




