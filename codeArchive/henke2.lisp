(# tab1 (alloc 1024))

(~ writer
	(write tab1 (rv -1 1) (count 1024)))

(samp-schedule
	(~ writer) 
	(line (seq 1 4) (ch .1 .5 2 4)))

(line-gen
	(index-lin tab1 (+ (count2 128) (line (seq 0 712) (rv .01 10))))
	(st 2)
	:pan (rvfi -1 1)
	)