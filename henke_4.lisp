(# tab1 (alloc 128))

(~ writer
	(write tab1 (ch OSC.table2) (count 128)))

(~ readFirstValue
	(index OSC.table1 (st 0)))

(samp-schedule
	(~ writer) 
	(line (mtof (+ (~ readFirstValue) 1))  (st 0.02)))


(fun a
	(line (rv -1 1) (rv .1 .5))
	)

(clone
(step-pan-gen
	(list-walk tab1 (sometimes (rv -30 30) (st 1) (mtof (+ (~ readFirstValue) 1))))
	(st 2)
	(rv a a)
	) 2)
