
(fun bah
	(statemachine (list 
		(weights ((1 200) (0 1)))
		(weights ((2 200) (0 1000)))
		(weights ((3 2000) (0 1)))
		(weights ((4 300) (3 20000)))
		(weights ((5 400) (3 4)))
		(weights ((6 200) (4 2)))
		(weights ((7 300) (0 2)))
		(weights ((8 10000) (5 6)))
		(weights ((9 50000) (1 1)))
		(weights ((10 200) (0 1) (8 5)))
		(weights ((11 200) (0 3)))
		(weights ((12 300) (0 1)))
		(weights ((13 100) (1 1)))
		(weights ((14 400) (2 5)))
		(weights ((15 200) (1 2)))
		(weights ((15 300) (0 300)))
		)))

(clone 
(step-pan-gen
	 (index 
	 	(list 
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 1000 44100)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 1024)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 180 200 (ch 0.99 1.01)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.1 3.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 1000 44100)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 400 14000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
	 	 (latch (cycle (t (bounded-mup-walk 9000 12000 (ch 0.5 2.0 1.5)) (fractRandTimer (ch 0.0003 0.002 0.1 0.02  3.0 11.0)))) (st (rvfi 10 256)))
		 )
	 bah)
	(st 1)
	(line (seq -1 1) (ch 3 5 7 11 12))
	)
5)

