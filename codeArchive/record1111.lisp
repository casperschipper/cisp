(# tab1 (fillf 441000 0 0))

(samp-schedule 
	(write tab1 (audioIn (st 0)) (count (table-cap tab1)))
	(st 1)
	)

(fun a
	(list-walk (1 2 3 4 5 6 7 8) (hold (seq -1 1) (seq 1 1 1 1 2 1 (ch 1 2)))))

(fun octaver
	(t 
		(reset (mup-walk 1.0 (ch 0.5 2.0)) (st 1.0) (st 20))
		(st 1.0)
		))



(fun offset
	(line
		(seq 0 40000)
		(t (* octaver (/ a a)) (ch 0.1 0.2 0.3 1.0 2.0 3.0))))

(clone
(step-gen
(leakDC
	(* (index-lin tab1 (+ (bounded-walk (st 0) (st 44100) (t (/ a a) (ch 0.1 0.2 0.5 2.0 4.0))))) 10)
	(st 0.96))
(st 1)
:pan (rvfi -1 1))
5)