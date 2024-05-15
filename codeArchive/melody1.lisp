
(sci2
	saw
	(st 0.14)
	:freq 
		(seq 
			(index (100 200 300 400 500 600 700) (reset (walk 0 (hold (seq -1 2) (seq 1 2))) (st 0) (st 32)))
			(index (100 200 300 400 500 600 700) (reset (walk 0 (hold (seq -1 2) (seq 1 2))) (st 0) (st 17)))
			(index (100 200 300 400 500 600 700) (reset (walk 0 (hold (seq -1 2) (seq 1 2))) (st 0) (st 19)))
			)
	:dur (st 0.4))