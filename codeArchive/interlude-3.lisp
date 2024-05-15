(# table
	(collect (bounded-walk -1 1 (rv -0.01 0.01)) 50000))

(fun a 
	(t
		(seq -1000 -5 -1 0)
		(seq 3 1 7 11)))

(fun c 
	(t
		(seq 1000 10000 10)
		(seq .5 1.5)))

(fun b 
	(t
		(seq 1)
		(seq 3 1 7 11)))

(clone
(step-gen
	(list-walk table
	(index 
		(list a b)
		(stream-weights (0. 1) (list c (st 1)))))
	(st 1)) 2)