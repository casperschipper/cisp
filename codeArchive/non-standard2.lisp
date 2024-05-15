

(fun freq
	(/ 1.0
		(t 
			(reset 
				(bounded-mup-walk 100 1000 (ch 0.99 1.01))
				(st 50)
				(ch 4 8 7 11 13))
			(t (ch 0.1 0.1 (rv 0.1 0.2)) (seq 1 2 4 8)))))

(fun offset
	(line
		(seq 0 512)
		(ch 4 8 11 15)))

(clone
(step-pan-gen
	(* (index-lin OSC.table9 
		(line (+ (seq 0 64) offset) freq)) 0.01)
	(st 2)
	(line (seq -1 1) (ch .1 .2 .4 4.))
)
2)