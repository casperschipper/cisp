(# mytab
	(collect (bounded-mup-walk 110 19000 (ch 0.66666667 1.5)) 256))

(samp-schedule
	(write mytab (bounded-mup-walk 110 19000 (ch 0.666666667 1.5)) (count (table-cap mytab)))
	(st 4))

(clone 
(step-gen
	(cycle (t (list-walk mytab (hold (seq -1 1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 3 4))) (hold (ch 0.001) (ch 3 6 9) )))
	(st 1.0)
	:pan (rvfi 0 1))
20)