(fun mupper (t (rv 1 40) (ch 0.1 0.2 0.4 0.8 1.6 3.2 6.4)))

(fun silent (t (seq 0.001 0.1 0.2) (ch 1 2 4)))

(fun ampy (t (seq silent 1) (ch 0.1 0.100001)))

(clone
(step-gen
(seq (* ampy 0.5) (* ampy -0.5)) (/ 44100 (t 
	(index (collect (walk 100 (rv 99.95 100.1)) 10) (loop (rv 0 10) (seq 2 (ch 2 3 4)) (ch 2 3 6))) 
	(* (seq .1 .2)  mupper))) :pan 0 )

10)
