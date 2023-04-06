(~ interval
	(/ 44100 
		(mtof (- (slider 3 1 0) 40)
		)))

(fun tableLength
	(line (seq 2 64) (st 7)))

(clone
	(step-pan-gen
		(seq 
			(list
				(index OSC.table1 (+ 
					(count2 (+ (slider 3 1 1) (rv 0 (slider 3 1 2)))) (+ (slider 3 1 0) (rv 0 (slider 4 1 3)))))
				(latch (st 0) (st 70))
			))
	(st 1) 
	(st (rvfi -1 1)) ) 5)
