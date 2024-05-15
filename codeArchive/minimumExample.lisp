(# mem (list 0.))
// this is just a cell to keep last position

// let's go!
(samp-schedule 
	(write mem 
		(index 
			(list 
				(rv 0 3)
				(seq 0 1 2 3)
				(st 3)
				(st 0))
		(seq mem)) 
		(st 0))
	(t (ch 1 2 40 100 2000 5000) (fractRandTimer (ch 0.001 0.2 0.3 0.4 0.8 1.6))))

(fun a 
	(line (seq 1 10) (ch 0.001 0.1 0.2 0.3 (rv 5 10))))

(fun b
	(line (ch 1 7 6 5 2) (ch 0.001 0.1 0.2 0.4 0.5 4. 3.5)))

(fun c
	(line (ch 1 2 3 4 5 6) (fractRandTimer (ch 0.001 0.1 0.2 0.4 0.5))))

(step-gen
	(seq -1 1)
	(index (list a b c (st 1)) (seq mem))
	:pan -1)

(step-gen
	(seq -1 1)
	(index (list a b c (st 1)) (seq mem))
	:pan 0)

(step-gen
	(seq -1 1)
	(index (list a b c (st 1)) (seq mem))
	:pan 1)

