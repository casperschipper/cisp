(# tab1 (list 1. 2 3 4 5 6 12 13 100))

(fun mupper 
	(t
		(ch 0.001 0.1 0.2 0.3 0.4 0.6 1.0)
		(ch 0.001 0.1 0.2 0.3 0.4 0.6 1.0)))


(fun tab1b
	(line 
		(seq 0 (table-cap tab1))
		(* (ch 1 3 5 7) mupper)))

(~ speed
	(st 1))

(fun a 
	(hold 
	(index ( (* (st -1) (~ speed)) (* (st 1) (~ speed))) (rv 0 2))
	(index tab1 (rv tab1b tab1b))))

(fun bottom
	(line (seq 0 512) (ch 1 3 5)))

(fun top
	(line (seq 0 512) (ch 1 3 5)))

(step-gen
	(write OSC.table9 (+ (* (index-lin OSC.table9 (bounded-walk bottom top a)) 0.1) (seq OSC.table9)) (count 512))
	(st 1))

