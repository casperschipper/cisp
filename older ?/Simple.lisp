(fun topper
	(line 
		(ch (grow 1 2 3)) 
		(ch .1 4 8 16)))

(fun slider
	(t
		(seq 3200 18 24 (ch 1 1 33 42) 2900 30 (st (rvi 20 50)) 20 1 (rv 1 10))
		(rv 0 topper)))

(fun foo
	(index 
		(
			(ch 0 1)
			(hold (seq 0 1) (rv 1 10))
			(hold (seq 0 1) (ch (grow 1 2 8)))
			)
		(t (ch 0 1 2 3) (st 1))))

(clone 
(step-gen
(seq -1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
(t (index (list slider slider) foo) topper) 
:pan (rvfi -1 1))
4)