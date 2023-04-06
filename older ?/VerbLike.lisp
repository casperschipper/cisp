(# NOISE
	(fillf 1024 -1 1))


(procedure replaceTable
	(# NOISE (fillf 1024 -1 1)))

(schedule 
	replaceTable (ch 1 2 4 8))

(fun maxiCtrl
	(t
		(ch 1024)
		(ch 0.1 0.5 1.0 2.0)))

(fun decayRate
	(t
	(- 1.0 
		(/ 1.0 (ch 500)))
	0.5))

(pulse-gen
(* (seq NOISE :max maxiCtrl) (reset 
	(mup-walk 1 decayRate) (st 1) (st 5000)))
(t (exprv 1 1000 5) (ch .01 .02 0.05))
)