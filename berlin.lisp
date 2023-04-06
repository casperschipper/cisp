(# tab1 (fillf 256 0 0))

(~ writer 
	(write tab1 (rv -1 1) (rv 0 256)))


(schedule 
	(~ writer)
	(st 0.001))



(fun stepper
	(hold
		(seq -1 1)
		(hold
			(rv 1 3)
			(line (seq 1 100) (rv 0 0.1)))))

(step-gen
	(write tab1 (index tab1 (bounded-walk (st 0) (st 256) stepper)) (loop (count 256) (ch 1 2 4 8 16 256) (ch 4 8 16 32 64)))
	(st 1) :pan (rvfi -1 1))

(step-gen
	(write tab1 (index tab1 (bounded-walk (st 0) (st 256) stepper)) (loop (count 256) (ch 1 2 4 8 16 256) (ch 4 8 16 32 64)))
	(st 1) :pan (rvfi -1 1))

(step-gen
	(write tab1 (index tab1 (bounded-walk (st 0) (st 256) stepper)) (loop (count 256) (ch 1 2 4 8 16 256) (ch 4 8 16 32 64)))
	(st 1) :pan (rvfi -1 1))

(step-gen
	(write tab1 (index tab1 (bounded-walk (st 0) (st 256) stepper)) (loop (count 256) (ch 1 2 4 8 16 256) (ch 4 8 16 32 64)))
	(st 1) :pan (rvfi -1 1))
