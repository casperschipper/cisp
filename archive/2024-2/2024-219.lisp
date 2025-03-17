(midi-note-channel-multi  
	(reset (bounded-walk (st 0) (st 128) (ch -7 7)) (st 60) (st 5))
	(ch 0.1)
	(seq (seq 100 30))
	(seq 1)
	(seq 1)
	(st 2))  