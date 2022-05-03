(sync 0.2)

(# scale 
	(0. 2 5 7 9 12 14 16 17 19 24))

(fun wscale (idx)
    (index scale idx))

(fun lenny
	(st 0.3))

(fun onezero
	(hold (seq 0 2)
	 (seq 21)))

(fun octaver (x) 
	(+ x (hold (seq 0 12) (rv 24 55))))

 (midi-note-channel 
 	(seq 0.2)
 	(+ 
 		(seq 
 			(wscale (walk 0 (ch 0 0 0 0 0 0 0 0 0 2))) 

 		(+ (seq (wscale (walk 2 (ch 0 0 0 0 3)))) onezero)

 		(octaver (seq (wscale (walk 4 (ch -1 0 0 0 0 0 0 0 0 0 0)))) )
 		)
 	60)
 	(seq lenny lenny lenny)
 	(st 80) 
 	(st 3))