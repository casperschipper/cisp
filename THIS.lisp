
(fun bah
	(statemachine (list 
		(rv 0 7)
		(weights ((2 200) (0 1)))
		(weights ((3 200) (0 1)))
		(weights ((4 300) (1 2)))
		(weights ((5 400) (3 4)))
		(weights ((6 200) (4 2)))
		(weights ((7 300) (0 2)))
		(weights ((0 300) (1 1) (7 1)))
		)))

(fun a
	(index (list 0.99 1. 2 3 4.5 9.0 5 6 7 8) bah))

(fun fluid
	(line (ch 0.001 0.75 4.4)
		(ch 0.3 4.0 8.0 10.0)))

(fun mupper
	(t 
	(bounded-mup-walk
		(st 32.0)
		(st 256.0)
		(ch 0.5 2.0))
	(ch 4 8 0.3)))

(clone
(step-gen
	(* (cycle (t (* (/ a a) 200) fluid )) mupper)
	(st 1)
	:pan (rvfi 0 3))
10)