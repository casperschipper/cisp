(fun mupper (t (rv 1 40) (ch 0.1 0.2 0.4 0.8 1.6 3.2 6.4)))

(fun silent (t (seq (t (seq 0 1) (st 0.1)) 0.1 0.2) (ch 1 2 4)))

(fun ampy (t (seq silent 1) (ch 0.06 0.06001)))

(fun detuned (line (seq 100 (rv 0 100)) (rv 30 90)))

(clone
(step-gen
(seq (* ampy 0.5) (* ampy -0.5)) (/ 44100 (t 
	(index ((* detuned 2) (* detuned 1) (* detuned 3) (* detuned 4) (* detuned 5) (* detuned 6) (* detuned 7) (* detuned 8) (* detuned 9)) 
	 (loop (rv 0 10) (seq 2 (ch 2 3 4)) (ch 2 3 6))) 
	(* (seq .1 .2)  mupper))) :pan (rvfi -1 1) )

10)
