(~ diffLim
	(t (seq 509 1 512 499 200) (ch 0.1 0.5 0.9 2.0)))

(clone
(step-gen
(seq OSC.table9 :max (t (rv (~ diffLim) 512) (fractRandTimer (ch 0.5 0.9 2.0 3.0 9.0))))
(st 1)
:pan (rvfi -1 1))
4)