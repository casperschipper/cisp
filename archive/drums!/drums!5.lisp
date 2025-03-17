(midi-note-channel-multi 
	(seq 36)
	(st 0.1)
	(ch 40 20 100)
	(st 10)
	(seq 1 0 0 )
	(st 2)) 



(midi-note-channel-multi 
	(seq 38)
	(st 0.1)
	(seq (st 80)) 
	(st 10)
	(seq 0 1 0 )
	(st 2))


(midi-note-channel-multi 
	(seq 42)
	(st 0.1)
	(seq (st 80)) 
	(st 10)
	(seq 1 )
	(st 2))

(midi-note-channel-multi 
	(reset (walk 82 (ch -5 -7)) (st 82) (st 5))
	(st 0.1)
	(seq (st 80)) 
	(seq 1)
	(seq 0 1 0 )
	(st 2))

	 


	 



