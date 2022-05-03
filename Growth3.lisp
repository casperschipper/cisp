(# wave (fillf 32 -1 1))

(schedule
	(write wave (clip (+ (seq wave) (rv -.1 .1)) -1 1) (rv 0 32))
	(st 0.1))

(clone
(step-gen
	(hold 
		(index wave (+ (count 4) (hold (rv 0 32) (st 100000000000000)))) (hold (ch (10 20 30 40 50 101 99 103)) (seq 1000 100 4000 8000)))
	(st 1)
	:pan (rvfi -1 1)) 10)
	