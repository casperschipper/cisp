
(fun patt
	(seq 1 2 3 2))

(fun holdPatt
	(hold patt (weights ((1 100) (2 10)))))

(fun ampy
	(seq 0 (latch (st 100) holdPatt)))

(fun ampy2
	(seq 0 (latch (st 100) patt)))



(midi-note
	(st 0.13)
	(hold (seq 50 100 80) patt)
	(st 0.1)
	ampy)

(midi-note
	(st 0.13)
	(hold (seq 50 100 80) (hold patt (weights ((1 100) (2 10)))))
	(st 0.1)
	ampy2)