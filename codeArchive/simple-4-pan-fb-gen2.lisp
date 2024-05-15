// THIS IS REALLY GOOD

(fun bigOrSmall
	(t
	(seq (weights ((1 100) (1000 10) (3000 3))) (rv 1 3) (rv 1 55))
	(ch (grow 0.1 2 7))))

(fun topper
	(line 
		(ch (ch (grow 1 2 3)) 0.001 0.0002) 
		(ch .1 4 8 16)))

(fun slider
	(t
		(seq bigOrSmall bigOrSmall bigOrSmall bigOrSmall bigOrSmall bigOrSmall)
		(rv 0 topper)))

(fun foo
	(index 
		(
			(ch 0 1)
			(hold (seq 0 1) (rv 1 10))
			(hold (seq 0 1) (ch (grow 1 2 8)))
			)
		(t (ch 0 1 2 3) (st 1))))

(fun panner
	(index 
		(
			(rv -1 1)
			(hold (seq -1 1) (rv 1 10))
			(hold (rv -1 1) (ch (grow 1 2 8)))
			)
		(t (ch 0 1 2 3) (st 1))))

(clone 
	(pulse-fb-gen
		(seq (collect (* (exprv 0 1 5) (ch -1 1)) 1024) :max (t (ch 4 6 1024 8 512) (ch 0.1 0.2 0.4 0.8 1.6 3.2)))
		(t (index (list slider slider) foo) topper) 
		(t panner (fractRandTimer 0.0001))
		(hold (ch 1.0 2.0 3.0 4.0 88 8800) (ch 1 2 3000))
		(t (ch 0.9 -0.9 -0.5 1.0 0.0) (ch 0.1 0.2 0.3 0.4))
		)
3)