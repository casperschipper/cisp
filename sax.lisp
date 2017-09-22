(fun holder (arg)
	(hold arg (ch 15 17)))


(fun one
	(seq 0.33333 0.5 1.25 0.25 5))

(fun two
	(seq 0.66667 1.33333 1.0 1.666666667))

(fun three
	(seq 2.0 1.5 1 3 4))

(fun maxi
	(line (seq 0 15) (ch 1 2 5 7)))

(fun pitch
	(t
		(hold (seq (holder one) (holder two) (holder three) 0.75 2) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2))
		(seq 1 2 4 2)))

(clone
(
	line-gen
	(index (list
	(index-lin OSC.table9 (bounded-walk 0 1024 (* (line  (seq 1.9 2.1) (ch 16 32 60)) pitch  )))
	(bounded-list-walk (st 0) (st 512) OSC.table9 (hold (ch (* -1 one) (* two 1)) (index (grow 1024 2 15) (rv 0 maxi)))))
	(t (count 2) (ch 3 5))
	)
	(st 1)
	:pan (rvfi -1 1)
	)
3)