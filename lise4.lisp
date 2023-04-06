(# history (collect (hzPhasor (st 100)) 441000))

(fun stepper
		(index 
			(
				(t (rv -1 1) (line (ch 0.001 1.0) (ch 3 7 11)))
				(t  
					(* (ch -1 1) (ch 0.667 1.5 1 1 1 1 0.999 1.001 4 8))
					 (ch (grow .1 2 7)))
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
	      indexer) 1.0) (hold (seq (count2 441000) (st 1)) (seq 1 1000000))) (hzPhasor (line (seq 100 1000) (ch .1 5))))
	(st 1))

(clone
(line-gen
	(index-lin
	      history 
	      indexer)
	(st 1.0)
	:pan (rvfi -1 1))
5)