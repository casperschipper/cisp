(fun speedmup
	(t (seq 0.0001 0.1 1.0 0.01) (ch 5.0 7.0 0.1))
	)

(fun topValue
	(t
		(seq (ch 1 2 3) (ch 100 200 300) (ch 10 20 3000))
		(ch 1 2 4 8 16 32)
		)
	)

(~ adder
		(index (list 
			(rv 0 topValue) 
			(t (ch 0 3 5 2 9) (ch 0.01 0.02 0.2 0.3 0.5)) 
			(rv 0 topValue) 
			(rv 0 topValue)
			(st -40)
			(st -20)
			(st 50)
			(st -50)
			)
		(t 
		(rv 0 8)
		(* (ch (grow 1 2 5)) speedmup) )))

(fun pitchx
	(t (list-walk (list 40 80 60 50 100 120 320 640) (ch 1))
		(ch (grow 4 2 6))))

(fun pitchy
	(t (list-walk (list 40 50 70 75 85 105 100 120 320 400) (ch 1))
		(ch 4 2 6)))

(clone
(step-gen
(hold (seq -1 1) 
	(seq 
		(+ pitchx (~ adder))
	 (+ pitchy (~ adder))))
(st 1) :pan (rvfi -1 1))

8)