(fun a
	(t
		(rv 1000 12000)
		(rv 30 100)))

(fun b
	(t
		(rv 0 100)
		(st 1000000)))

(fun c
	(t
		(rv 2000 40000)
		(st 100000)))

(fun holder (input)
	(t
		input
		(t
			(seq 0.0002)
			(rv 1 5))))

(fun freq
	(seq
		(linseg 
			(list-walk (list 3 30 a 100 40 a) (hold (seq 1 2 c) (seq 13 17)))
			(list-walk (list a a a 10 80 a) (hold (seq 1 2 c) (seq 7 23)))
			(list-walk (grow 1 2 13) (+ (hold (seq 1 2 c) (seq 31 39)) b)))))

(clone
(step-pan-gen
	(cycle (holder freq))
	(st 2)
	(line (seq -1 1) (st 10))) 4)