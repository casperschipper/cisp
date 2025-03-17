
(midi-note-channel-multi  
  	(reset (walk 0 (ch 7 5 -5)) (st 60) (ch 12))
	(ch 0.1)
	(seq (seq 100 30))
	(rv 1 6)
	(seq 1)
	(st 2))  


(fun a (ch 100 80 30 30 30 30) )
 
(midi-note-channel-multi 
	(seq 36)
	(st 0.1)
	(seq a a a)
	(st 10)
	(seq 1 0 0 1 0 0)
	(st 2))

(midi-note-channel-multi 
	(seq 38)
	(st 0.1)
	(seq a a a)
	(st 10)
	(seq 0 1 0 (ch 0 1) 1 0)
	(st 2)) 

(midi-note-channel-multi 
	(seq 42)
	(st 0.1)
	(seq (st 100))
	(st 10)
	(seq 1)
	(st 2)) 