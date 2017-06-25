(~ adder
		(index (list 
			(rv 0 3) 
			(t (ch 0 3 5 2 9) (ch 0.01 0.02 0.2 0.3 0.5)) 
			(rv 0 1) 
			(rv 0 2)
			(st -30)
			(st -20)
			(t (seq 10 40 80 160 320) (fractRandTimer (ch 0.1 0.2 0.04 0.001 2.0)))
			(st -10)
			)
		(t 
		(rv 0 8)
		(ch (grow 1 2 5)))))

(~ mupper
	(t
	(seq 8.0 4.0 1.0)
	(st 8.0)
	))

(fun pitchx
	(t (list-walk (list 10 5 6 40 80 60 50 100 120 320 640) (ch 1))
		(ch (grow 2 2 6))))

(fun pitchy
	(t (list-walk (list 10 5 6 40 50 70 75 85 105 100 120 320 400) (ch 1))
		(ch (grow 2 2 6))))

(clone
(step-gen
(hold (seq -1 1) 
	(seq 
		(+ (* pitchx (~ mupper)) (~ adder))
	 (+ (* pitchy (~ mupper)) (~ adder))))
(st 1) :pan (rvfi -1 1))

8)