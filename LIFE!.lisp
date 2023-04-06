(# history (collect (hzPhasor (st 100)) 441000))

(fun stepper
		(index 
			(
				(rv -1 1)
				(line (* (ch -1 1) (ch 0.5 1.25  0.25 2 3)) (ch (grow 1 2 15)))
				) 
			(t 
				(weights ((0 50) (1 100)))
				(ch (grow 0.1 2 8)))
		))

(fun indexer
	(bounded-walk (st 0) (table-cap history) stepper))


(step-gen
	(write history
	(* (
		index-lin
	      history 
	      indexer) 1.0) (count 441000))
	(st 1))

(clone
(step-gen
	(* (* (
		index-lin
	      history 
	      indexer) 1.0) 1)
	(st 1.0)
	:pan (rvfi -1 1))
4)