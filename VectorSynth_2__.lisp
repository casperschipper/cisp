(# tab (alloc 44100))

(fun maxFreq
	(t
		(* (seq 0.001 0.0005 0.1 0.003 0.0004) (mtor (rv -24 24)))
		(ch 0.1 0.5 1 2 0.001)))

(fun maxFB
	(t
		(* (seq 440 44100 2000 10) (mtor (rv -24 24)))
		(ch 0.1 0.5 1 2 0.001)))

(fun mupper
	(t 
		(seq -2 1 0.8 -0.8 0.1 -0.3) 
		(ch 0.5 3 5)))

(step-gen
	(write 
		tab 
		(* mupper (+ (seq tab) (delayi (line (seq -1 1) (line (seq 0.0001 maxFreq) (line (seq 0.0001 0.00010001) (seq 0.0001 0.1)))) 44100 (line (seq 0 (ch 40 4410 44100 20 10 3)) (ch 0.001 0.0001 0.02 0.03 0.1 0.2 0.2)))))
		(count maxFB))
	(st 1))