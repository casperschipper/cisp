(fun a
	(line
		(seq 0 12)
		(ch .1 1 10)))

(~ stepper
(hold (rv 1 1.1) (index (grow 1 2 12) (rv a a))))