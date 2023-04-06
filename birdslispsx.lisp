(# mups (0.5 1.0 2.0 0.198327984273 1.122348973893 1.00001 0.999999))

(# mupsnow (0.6667 1.5))

(schedule
	(write mupsnow (ch mups) (seq 0 1))
		(st .2))


(fun a
	(reset 
		(bounded-mup-walk (st 50) (st 15000) (ch mupsnow) 1000) 
		(ch 1000 4000) (ch 50 100) ))


(# times (steno "100..1000 40000..40100"))



(fun tend
	(line 
		(seq 0 (- (table-cap times) 1))
		(rv 3 7)))

(fun tim
	(index times
		(rv tend tend)))


(sci2 
	voiceflat
	(st 0.0001)
	:freq a
	:duration (/ 1 (line (seq 10 20) (ch 2 4)))
	:amp (st 0.01)
	:pan (hold (rv -1 1) (rv 1 10))
)


