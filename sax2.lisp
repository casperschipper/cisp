(fun holder (arg)
	(hold arg (ch 1 3 5 7)))


(fun one
	(list-walk (0.33333 0.5 1.25 0.25 5) (ch -1 1)))

(fun two
	(list-walk (0.66667 1.33333 1.0 1.666666667) (ch -1 1)))

(fun three
	(list-walk (2.0 1.5 1 3 4) (ch -1 1)))

(fun maxi
	(line (seq 0 15) (ch 1 2 5 7)))

(fun pitch
	(t
		(hold (seq (holder one) (holder two) (holder three) 0.75 2) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2))
		(ch 1)))

(fun fivehundred
(line
	(seq 499 512)
	(ch 10 12 13))
)

(clone
(
	line-gen
	(index (list
	(index-lin OSC.table9 (bounded-walk 0 1024 (* (line  (seq 0.99999 1.00000001) (ch 16 32 60)) pitch  )))
	(index-lin OSC.table9 (bounded-walk (st 0) (st 512) (* (hold (seq -1.5 1.5) (seq fivehundred fivehundred)) pitch))))
	(t (st 1) (ch 3 5))
	)
	(st 1)
	:pan (rvfi -1 1)
	)
3)