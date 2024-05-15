(fun a
	(line 
		(seq 0 6)
		(ch .3 .5 .7)))

(~ fish (line (seq 0 10) (st 100)))

(step-gen
	(seq -1 1)
	(index (list 1 2 3 4 (t (ch 1 30 (t (ch 10 70 999) (ch (~ fish) 0.2 0.5))) (ch 0.1 0.2 0.5)) 6 8 100) (rv a a)))