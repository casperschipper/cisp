(# tab1 (fillf 1 0 0))

(# si (sine 256 (1.0)))

(step-gen
	(waveosc si (st 0.001))
	(st 1))

/*
(step-gen
(waveosc si (* 10  (write tab1 
	(bounded-walk 0 2048
		(bounded-walk (* -1 (osc-in 5321 "one")) (osc-in 5321 "one")
			(index OSC.table9 (seq tab1))))
	(count (length tab1)))))
	(st 1)
	:pan (rvfi -1. 1.))
*/




