(midi-note-channel
	(* 0.12 (seq 1. 4 1 2))
	(+ (hold (seq 48 46) (seq 3 2))  (seq 0 3 0 5))
	(* 0.12 (seq 1. 1 1 1))
	(line (seq 30 80) (st 7))
	(st 1))

(midi-note-channel
	(* 0.12 (seq 1. 2))
	(hold (seq 57 58 60 58) (seq 3 2 1 2))
	(* 0.1 (seq 1. 2 1 1))
	(line (seq 30 80 30) (st 5))
	(st 2))  

(midi-note-channel
	(* 0.12 (seq 1. 1 1))
	(hold (seq 60 (seq 67 69 72)) (seq 1))
	(* 0.1 (seq 1. 2 1 1))
	(line (seq 30 80 30) (st 11))
	(st 3)) 

(midi-note-channel
	(* 0.12 (seq 6 3 2 1 1 1 1 1 3 6))
	(st 84)
	(* 0.1 (seq 1. 2 1 1))
	(line (seq 30 80 30) (st 3))
	(st 4))  



(midi-note-channel
	(st 0.12)
	(hold (seq 86) (st 2))
	(st 0.1)
	(seq (line (seq 30 80) (st 5.5)) (line (seq 80 30) (st 5.5)) )
	(st 5))


