(fun foo
	(mtof 
		(+ 
		(index ((st 0) 7 12 19 (hold (seq 26 27 29 31) (ch 11 13 14)) ) (walk 0 (weights ((1 10) (-1 100))))) 
		50)))



(fun beat (seq 0.11 0.09))

(fun pan 
	(line (ch -1 1) (rv 0 3)))

(sci saw beat foo 0.6 0.9 pan)
(sci saw beat foo 0.6 0.9 pan)
(sci saw beat foo 0.6 0.9 pan)
(sci saw beat foo 0.6 0.9 pan)







