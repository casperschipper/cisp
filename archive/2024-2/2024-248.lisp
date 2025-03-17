
(midi-note-channel-multi  
  	(reset (walk 0 (ch 7 5 -5)) (st 60) (st 1))
	(ch 0.1)
	(seq (seq 100 30))
	(seq 1 2 3)
	(seq 1)
	(st 2))  


(fun a (ch 100 80 30 30 30 30) )

(midi-note-channel 
	(st 0.14)
	(seq (list-walk (36 38 36 36) (ch -1 1)) (latch (st 38) (st 4)) (seq 42 40 42 38 39))
	(st 0.1)
	(seq a a a)
	(st 10))