(# tab1 (alloc 1024))

(~ writer
	(write tab1 (rv -1 1) (count 1024)))

(test (slider 3 1 1))

(samp-schedule
	(~ writer) 
	(line (mtof (+ (slider 3 1 1) 1)) (st 0.3)))


(clone
(step-gen
	(index-lin tab1 (+ (count2 128) (line (seq 0 712) (ch 1 2 5))))
	(st 2)
	:pan (rvfi -1 1)
	) 4)
