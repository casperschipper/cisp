(fun glot
	(line
		(seq 1000 10000)
		(ch 33 17 11)))

(fun a
	(line
		(seq 0 12)
		(ch 1 2 4 8 12)))

(fun b
	(line (seq 0 12)
		(ch 1 2 4 8 12)))

(sci2 
 ;freqy 
  (* 
 (index 
	(list 100 200 300 400 500 600 700 800 900 1000 1100 1200)
	(rv a b))
     0.1)

 ping
 
(/ 1.0 (rf 1 100))
:freq (~ freqy)
:duration (/ 30.0 (~ freqy))
:pan (line (seq -1 1) 
	(t
		(ch 0.001 0.1 0.2 0.3 0.4 0.5)
		(ch 0.001 0.1 0.2 0.3 0.4 0.5)))
)