(# mem (list 0.))
// this is just a cell to keep last position

(# spikes
	(collect
	  (/ 1.0 (rf 1.0 1000)) 4410))

(# bulps
	(collect
	  (hold 
	  	(/ 1.0 (rf 1.0 1000))
	  	(rv 1 300)) 100))


(fun a 
	(line
		(seq 0 10000)a
		(ch 0.01 0.1 0.5 1.5 5.5)))

// let's go!
(samp-schedule 
	(write mem 
			(index 
				(list 
					(hold (seq 0 4) a) // 0
					(hold (seq 0 1 2 3 4) a) // 1
					(hold (seq 0 1 2 3 4) a) // 2
					(hold (seq 0 1 2 3 4) a) // 3
					(hold (seq 0 1 2 3 4) a)) // 4
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




