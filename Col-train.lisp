(midi-note-channel
	(beat (st 105) (st 4))
	(reset (walk 0 (hold (seq (seq 4 3) (seq 5 7)) (seq 3 2 5))) (st 50) (seq 3 5))
	(beat 120 5)
	(seq 0 100 0)
	(st 1))

(midi-note-channel
	(beat (st 105) (st 4))
	(reset (walk 0 (hold (seq (seq 2 3) (seq -3 -4)) (seq 3 2 5))) (st 62) (seq 2 3))
	(beat 120 5)
	(seq 100 0 0)
	(st 2))

(midi-note-channel
	(beat (st 105) (st 4))
	(reset (walk 0 (hold (seq (seq 2 2 5) (seq -5 -7)) (seq 1 3 1 5))) (st 74) (seq 5 7))
	(beat 120 5)
	(seq 0 0 100)
	(st 3))



