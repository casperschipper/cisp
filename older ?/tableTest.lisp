(fun pitch 
	(line (/ 4.0 (index (1.0 0.66666667 2.0 4.0 2.75 2.25 3.0 7.0) (rv 0 8))) (ch 0.001 0.002 0.05 )))

(fun devi
	(line (seq 0.999999 1.000001) (ch 10 20)))

(fun posi 
	(line 
		(rv 0 500)
		(ch 4 8)))

(fun randy (t (rv 0 (line (seq 0 (ch 100 1000 100000 )) (ch 1 2 5))) (fractRandTimer 0.0001) ))

(~ posibus 
	(+ posi randy))

(clone
(step-gen
	(index-lin OSC.table9 (bounded-walk (~ posibus) (+ (~ posibus) 500) (* pitch devi)))
	(st 1) :pan (rvfi -1 1))
1)
