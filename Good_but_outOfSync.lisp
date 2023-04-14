
(sci2
	saw
	(ch 0.05 0.01)
	:freq 
		(+ (seq 
			(index (50 100 200 300 400 500 600 700) (reset (walk 0 (hold (seq -1 2) (seq 1 2))) (st 0) (st 32)))
			(index (50 100 150 300 400 500 600 700) (reset (walk 0 (hold (seq -1 2) (seq 1 2))) (st 0) (st 17)))
			(index (50 100 200 350 400 550 600 900) (reset (walk 0 (hold (seq -1 2) (seq 1 2))) (st 0) (st 19)))
			) (line (seq 0.01 3) (rv 1 11)))
	:dur (rv 1 20)
	:pos (rv -1 1)
	:amp (st 0.01))