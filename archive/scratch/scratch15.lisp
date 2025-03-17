// pitch
// dur
// velo
// channel
// chord
// inchannel

(fun a 
	(line (seq 40 100) (ch 3 4 7)))

(midi-note-channel-multi 
(st 36)
(st 1.0)
(seq 100 a a a )
(seq 2)
(seq 1 0 0 0)
(seq 1)
)


(midi-note-channel-multi 
(st 44)
(st 1.0)
(seq 100 80 40 100)
(seq 2)
(seq 1 1 1 1)
(seq 1)
)


(midi-note-channel-multi 
(bounded-walk 40 84 (ch -7 -5))
(st 1.0)
(seq 100 80 40 100)
(seq 1)
(seq 1 1 1 1)
(seq 1)
)