(midi-note-channel
	(line (seq 0.1 0.12) (ch 3 7))
	(hold (bounded-walk 0 64 (hold (seq -1 1) (rv 1 5))) (rv 3 10))
	(ch 0.01 0.2 0.5 4)
	(rv 0 128) 
	(st 1))