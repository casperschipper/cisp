(# history 
   (collect (rv -1 1) 44100))


(~ writer
    (write history (rv -1 1) (count 44100)))

(schedule
	(~ writer) (st 0.02))


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

(step-gen
(write history (list-walk history A) (count 44100))
(st 1)
:pan (rvfi -1 1))

(step-gen
(list-walk history A)
(st 1)
:pan (rvfi -1 1))

(step-gen
(list-walk history A)
(st 1)
:pan (rvfi -1 1))

(step-gen
(list-walk history A)
(st 1)
:pan (rvfi -1 1))

(step-gen
(list-walk history A)
(st 1)
:pan (rvfi -1 1))