(# table (fillf 2 1 10))
(# amps (fillf 16 -1 1))

(procedure casper 
	(# table (collect (ch 7 6 4 (rv 20 25)) (chi (list 4 8 16 32)))))

(procedure casper2
	(# table (collect (ch 100 101 200) 10)))

(procedure fillAmp
	(# amps (collect (rv -1 1)  (chi (list 4 8 16 3)))))

(schedule (seq casper casper2) (seq .5 .5))

(schedule fillAmp (ch .1 .2 .4 .8 10))

(fun stepper (t (* (rv 1 2) (ch -1 1)) (ch .1 .2)))

(fun app 
	(t 
		(rv 1 300)
		(ch .1 .2 .5)))

(fun looper (loop (rv app app) (ch 1 2 4 8) (ch 1 2 4 8)))

(clone
(step-pan-gen 
	(loop (seq amps) looper looper )
	(loop (seq table) looper looper )
	(loop (ch amps) looper looper))
8)