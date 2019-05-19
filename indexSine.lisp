
(# history (fillf 441 0 0))

(fun indexer
	(+ (count 127) (* (mtof (line (seq -40 40) (seq 1 3 2))) (seq history))))

(step-gen
(write history (index-lin (sine 64 (1.0)) indexer) (count (table-cap history)))
(st 1))