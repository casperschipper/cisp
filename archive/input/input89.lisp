(# tab1 (fillf 44100 0 0))


(step-pan-gen
(+ 
	(
		
		(write tab1 
			(delay 
			(audioIn 0) 
			44100

			(line 
				(seq 0 44100) 
				(reset (mup-walk 1.0 (/ (ch 1 2 3 4 5 6 7 8) (ch 1 3 5 7 11 13 17 23))) (st 1.0) (st 30))))
		(count (table-cap tab1)))

		(index-lin tab1 (line (seq 0 (table-cap tab1))
								(ch 0.5 2.0)))

		(index-lin tab1 (line (seq 0 (table-cap tab1))
								(ch 0.33333333 1.3333333)))

		(index-lin tab1 (line (seq 0 (table-cap tab1))
								(ch 0.6666667 1.5)))

		(index-lin tab1 (line (seq 0 (table-cap tab1))
								(ch 0.1 1.0 2.0 3.0)))
	)
)
(st 1)
(line (seq -1 1) (ch 0.1 1 2 3))
)
