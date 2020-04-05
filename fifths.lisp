(fun main
	(reset (walk 60 (seq (seq 7 7 (ch -7 -9) 12 7 14 7 7 -7) (seq -5 -4))) (seq 60 53 64 (rv 60 65)) (seq 2 2 3)))


(midi-note-channel
	(seq 0.14)
	(hold main (seq (latch (st 1) (st 5)) (latch (st 2) (seq 2 3 2 2 3 2 (ch 1 3)))))
	(seq 0.01 0.01 0.01 0.1 0.1)
	(seq 100)
	(st 1))


