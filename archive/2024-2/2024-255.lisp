
(midi-note-channel-multi  
  	(reset (walk 0 (ch 7 5 -5)) (st 60) (ch 3 6 9))
	(ch 0.1)
	(seq (seq 100 30))
	(seq 1 2 3 3 4 5)
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
	(seq 0 1 0 0 1 0)
	(st 2))