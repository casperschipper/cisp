(# history 
   (collect (rv -1 1) 44100))


(~ writer
    (write history (rv -1 1) (+ (count 44100) (rv 1 2000))))

(schedule
	(~ writer) (st 0.002))


(# steps
	(-1. -1 -1 -1 -1 -1 -1 -1 -1 -1 -4 4 1 1 1 1 1 1 1 1 1 1 1 2))

(fun b
	(line
		(seq 0 (table-cap steps))
		(ch 3 4)))


(fun a 
	(index
		steps
		(rv b b)))

(fun A 
	(loop
		a
		(ch 4 8 16 32 128)
		(rv 1 7)))


(fun loopSize
	(t
		(ch 4 8 16 32 120)
		(ch 3 4 7 11)))

(step-gen
(write history 
(hold
	(index
		history
		(+ (count2 (rv 2 200)) (hold (rv 0 44100) (st 8))))
	(ch 1 2 4 8))
(count 44100))
(st 1)
)

(step-gen
	(seq history)
	(st 1))
