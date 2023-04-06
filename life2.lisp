(# history (collect (hzPhasor (st 200)) 441000))

(fun stepper
		(index 
			(
				(rv -1 1)
				(line (hold 
					(* (ch -1 1) (ch 2 0.5 1 1.01 0.99 0.5 1.5))
					(ch 2 1 )) (ch (grow 1 2 5)))
				) 
			(t 
				(weights ((0 50) (1 100)))
				(ch (grow 0.1 2 8)))
		))

(fun indexer
	(bounded-walk (st 0) (table-cap history) stepper))


(step-gen
	(write history
	(+
	(* (
		index-lin
	      history 
	      indexer) 1.0) (count 441000)) (hzPhasor (st 200)))
	(st 1))

(clone
(line-gen
	(index-lin
	      history 
	      indexer)
	(st 1.0)
	:pan (rvfi -1 1))
3)