(midi-note-channel
	(* 0.12 (st 1))
	(seq 60)
	(* 0.12 (seq 1. 1 1 1))
	(seq (line (seq 30 (rv 80 90)) (st 3.5)) (line (seq 30 80) (st 4.5)))
	(st 1))

(midi-note-channel
	(* 0.12 (st 1))
	(seq 64)
	(* 0.12 (seq 1. 1 1 1))
	(seq (line (seq 30 100) (rv 3 5)) (line (rv 70 100) (rv 5 7)))
	(st 1))

(midi-note-channel
	(* 0.12 (st 1))
	(seq 67)
	(* 0.12 (seq 1. 1 1 1))
	(seq (line (seq 30 80) (rv 3 5)) (line (seq 30 80) (rv 5 7)))
	(st 1))



(midi-note-channel
	(* 0.12 (seq 1. 2))
	(hold (seq 57) (seq 3 2 1 2))
	(* 0.1 (seq 1. 2 1 1))
	(line (seq 30 80 30) (st 5))
	(st 2))  

(midi-note-channel
	(* 0.12 (seq 1. 1 1))
	(hold (seq 60) (seq 1))
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


