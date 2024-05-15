(fun a
	(line
		(seq (ch 1 30 2 3000) (ch 44 22 33) 100)
		(ch (latch (st 0.5) (st 10)) 5 7)))

(fun b
	(line
		(ch 1000 1100)
		(rv 100 101)))

(fun c 
	(line
		(ch 4900 4911)
		(rv 100 101)))

(fun d
	(t
		(seq 14000 20000 200)
		(seq 16000 8000 19000)))

(fun freq
		(linseg 
			(ftom (list-walk (list 3 30 b 100 d c) (hold (seq 1 2 3) (ch 1 10 200))))
			(ftom (list-walk (list 5100. b 4900 10 80 d) (hold (seq 1 2 3) (ch 1 30 55))))
			a))

(clone (step-gen
	(* (cycle (hold (mtof freq) a)) (t (seq 0.01 0.1 0.5 0.9 1.0) (fractRandTimer (/ 1.0 (mtof (rv -40 10))))))
	(st 1) :pan (rvfi 0 2)) 4)

