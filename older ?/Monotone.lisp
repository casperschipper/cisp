(~ adder
		(index (list 
			(rv 0 3) 
			(t (ch 0 3 5 2 9) (ch 0.01 0.02 0.2 0.3 0.5)) 
			(rv 0 1) 
			(rv 0 2)
			(st -40)
			(st -20)
			(st 50)
			(st -50)
			)
		(t 
		(rv 0 8)
		(ch (grow 1 2 5)))))

(fun pitchx
	(t (list-walk (list 1 80 120 160 320 640) (ch 1))
		(ch (grow 4 2 6))))

(fun pitchy
	(t (list-walk (list 1 80 120 160 320 640) (ch 1))
		(ch 4 2 6)))

(clone
(step-gen
(hold (seq -1 1) 
	(seq 
		(+ pitchx (~ adder))
	 (+ pitchy (~ adder))))
(st 1) :pan (rvfi -1 1))

8)