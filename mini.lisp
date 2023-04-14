(# rec (fillf 44100 0 0))

(samp-schedule 
	(write rec (leakDC (audioIn 0) (st 0.995)) (count (table-cap rec)))
	(st 1))

(clone 
(step-pan-gen
	(clip (index-lin rec (bounded-walk (st 0) (table-cap rec) (t (seq 10.0 20.0 30.0 3 5 6 0.666666667 1.5 3.0 0.3333333) (ch 0.25 0.5)))) -1.0 1.0)
	(st 1)
	(line (seq -1 1) (hold (ch 0.1 0.2 0.4 1.5 3.0) (st 3))))
6)