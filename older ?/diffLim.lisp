(~ selecty
	(index
		(
			(t (ch 22 34 77 87 91 107 203 256 512) (fractRandTimer (ch 0.003 0.001 0.2 0.5 2.0 4.0)))
			(t (ch 4 5 6 7 8) (fractRandTimer (ch 0.0001 0.0002 0.001 0.03 0.05 1.0 2.0 3.0)))
			(t (rv 0 512) (fractRandTimer (ch 0.001 0.1 0.2 0.4 0.0001 1.0 3.0))))
		(t (seq 0 1 2) (st 3.0))))

(~ lowLim
	(t (seq 0.02 0.4 0.01 0.0001) (fractRandTimer (ch 0.0001 0.2 1.0 5.0))))

(~ timeLim
	(t (seq 0.2 1.0) (fractRandTimer (ch 0.1 0.2 1.0 5.0))))

(step-gen
(* (seq OSC.table9 :max (t (seq (~ selecty) 512) (~ lowLim ))) 0.5)
(st 1)
:pan -1)

(step-gen
(* (seq OSC.table9 :max (t (seq (~ selecty) 512) (~ lowLim ))) 0.5)
(st 1)
:pan -0.33)

(step-gen
(* (seq OSC.table9 :max (t (seq (~ selecty) 512) (~ lowLim ))) 0.5)
(st 1)
:pan 0.33)

(step-gen
(* (seq OSC.table9 :max (t (seq (~ selecty) 512) (~ lowLim ))) 0.5)
(st 1)
:pan 1.0)


