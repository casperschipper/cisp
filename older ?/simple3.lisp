(fun bigOrSmall
	(t
	(seq (rv 2 40000) (rv 1 10) (rv 1 55))
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

(clone 
(step-gen
(seq (collect (exprv 0 1 50) 32))
(t (index (list slider slider) foo) topper) 
:pan (rvfi -1 1))
4)