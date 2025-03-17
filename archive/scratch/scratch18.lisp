// pitch
// dur
// velo
// channel
// chord
// inchannel

(fun a 
	(line (seq 40 100) (ch 3 4 7)))




(midi-note-channel-multi 
(st 44)
(st 1.0)
(seq 100 80 40 100)
(seq 2)
(seq 1 1 1 1)
(seq 1)
)


(midi-note-channel-multi 
(bounded-walk 40 84 (ch -7 -7 -12 12))
(st 1.0)
(ch 100 80 40 100)
(seq 1)
(seq (ch 1 1 1 1 3) 0 0 0)
(seq 1)
)

(midi-note-channel-multi 
(bounded-walk 40 84 (ch -5 0 -5))
(st 1.0)
(ch 40 50)
(seq 1)
(seq (ch 1 1 1 1 3) (ch 1 0 )0 0)
(seq 1)
)