(# table (collect  (seq (sine 128 (1.0))) 44100))

(~ phasor 
	(line (seq 0 441000) (seq 10 0)))


(~ top
	(line
		(hold (ch 0 1 10 44100 100) (ch 1 2 3))
		(ch 0.1 0.4 1.0 10)))

(~ timer
	(line
		(ch 0.1 0.01 1 3)
		(ch 1 2 3)))

(clone 
(step-gen
	(index-lin table 
		(+ (+ (~ phasor) 0)
		(line (seq 0.0 (~ top)) (rv 0 (~ timer)))))
	(st 1)
	:pan (rvfi -1 1)) 5)
