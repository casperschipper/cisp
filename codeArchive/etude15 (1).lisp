(fun 
	a
	(line
		(ch 0.0001 0.1 5)
		(ch 0.3 0.5 1.0 2.0)))



(~
	holder
 	(t
 		(bounded-mup-walk (st 1) (st 120) (ch 0.5 0.75 1.5 1.25))
 		a))

(fun mupper
	(t
		(bounded-mup-walk (st 0.5) (st 2.0) (ch 0.6666667 1.5))
		a))

(clone
(step-gen
	(hold (seq (grow 1.0 0.99 1024)) (* (~ holder) mupper))
	(st 1)
	:pan (rvfi -1 1))
6)