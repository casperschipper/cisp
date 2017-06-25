(fun pitchCtrl
	(t (seq (st 1) 5 7 2 4 8 3 (rv 1 52)) (ch 2.0 4.0 1.0)))

(~ latchCtrl
	(t (seq 1 2 3) (ch 1.0 2.0 4.0)))

(~ indexCtrl
	(t (seq 0 1 2 3 3) (ch 0.5 0.1 3.0)))

(fun selecty
	(index
		(
			(t (ch 22 34 77 87 91 107 203 256 512) (fractRandTimer (ch 0.003 3.0)))
			(t (ch 1 2 3) (fractRandTimer (ch 0.001 3.0)))
			(t (rv 0 100) (fractRandTimer (ch 0.1 5.0 2.0 0.0001)))
			(t (bounded-walk 0 510 (ch -70 0 30 -35 70)) (ch 0.01 0.2 0.3 0.5)))
		(~ indexCtrl)))

(~ lowLim
	(t (seq 0.02 0.4 0.01 0.0001) (fractRandTimer (ch 0.0001 1.0 8.0))))

(step-gen
(* (seq OSC.table9 :max (t (seq (latch selecty (~ latchCtrl)) selecty) (~ lowLim ))) 0.5)
(st pitchCtrl)
:pan -1)

(step-gen
(* (seq OSC.table9 :max (t (seq (latch selecty (~ latchCtrl)) selecty) (~ lowLim ))) 0.5)
(st pitchCtrl)
:pan -0.33)

(step-gen
(* (seq OSC.table9 :max (t (seq (latch selecty (~ latchCtrl)) selecty) (~ lowLim ))) 0.5)
(st pitchCtrl)
:pan 0.33)

(step-gen
(* (seq OSC.table9 :max (t (seq (latch selecty (~ latchCtrl)) selecty) (~ lowLim ))) 0.5)
(st pitchCtrl)
:pan 1.0)


