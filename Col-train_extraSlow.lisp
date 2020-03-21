(midi-note-channel
	(beat (st 70) (st 4))
	(reset (walk 0 (hold (seq (seq 4 3) (seq 5 7)) (seq 3 2 5))) (st 50) (seq 3 5))
	(beat 60 4)
	(seq 0 100 0)
	(st 1))

(midi-note-channel
	(beat (st 70) (st 4))
	(reset (walk 0 (hold (seq (seq 2 3) (seq -3 -4)) (seq 3 2 5))) (st 62) (seq 2 3))
	(beat 60 4)
	(seq 100 0 0)
	(st 2))

(midi-note-channel
	(beat (st 70) (st 4))
	(reset (walk 0 (hold (seq (seq 2 2 5) (seq -5 -7)) (seq 1 3 1 5))) (st 74) (seq 5 7))
	(beat 60 4)
	(seq 0 0 100)
	(st 2))

(midi-note-channel
	(beat (st 140) (st 4))
	(reset (walk 0 (hold (seq (seq 2 2 5) (seq -5 -7)) (seq 1 3 1 5))) (st 74) (seq 5 7))
	(beat 60 4)
	(seq 0 0 100)
	(st 3))

(midi-note-channel
	(beat (st 140) (st 4))
	(reset (walk 0 (hold (seq (seq 3 1 1) (seq -12 -7 0 -4 -12 -4)) (seq 1 3 1 5))) (st 50) (seq 5 7))
	(beat 60 4)
	(seq 0 0 100)
	(st 2))




(midi-note-channel
	(beat (st 70) (st 4))
	(reset (walk 0 (hold (seq (seq 4 3) (seq 5 7)) (seq 3 2 5))) (ch 50 62) (seq 3 5))
	(beat 60 4)
	(seq 0 100 0)
	(st 1))

(midi-note-channel
	(beat (st 70) (st 4))
	(reset (walk 0 (hold (seq (seq 2 3) (seq -3 -4)) (seq 3 2 5))) (ch 62 69) (seq 2 3))
	(beat 60 4)
	(seq 100 0 0)
	(st 2))

(midi-note-channel
	(beat (st 70) (st 4))
	(reset (walk 0 (hold (seq (seq 2 2 5) (seq -5 -7)) (seq 1 3 1 5))) (ch 74 80) (seq 5 7))
	(beat 60 4)
	(seq 0 0 100)
	(st 2))




