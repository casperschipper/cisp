(# mytab
	(collect (bounded-mup-walk 110 19000 (ch 0.66666667 1.5)) 16))

(samp-schedule
	(write mytab (bounded-mup-walk 110 19000 (ch 1.5 0.75)) (count (table-cap mytab)))
	(st 44100))

(clone 
(step-gen
	(cycle (t (list-walk mytab (hold (seq -1 1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 3 4))) (hold (ch 0.050) (ch 3 6 9) )))
	(st 1.0)
	:pan (rvfi 0 1))
20)