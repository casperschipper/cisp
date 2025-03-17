(fun a
	(hold
		(ch 100 80 50 30 10)
		(ch 3 5 7)))

(midi-note-channel-multi
	(st 36)
	(st 1.0)
	(seq 0)
	(st 1) 
	(seq (ch 1 0 0) 0 0 0)
	(st 2))

(midi-note-channel-multi
	(st 38)
	(st 1.0)
	(* (seq a a a) 0)
	(st 1) 
	(seq 1 0)
	(st 2))


(midi-note-channel-multi
	(st 42)
	(st 1.0)
	(seq a a a)
	(st 1) 
	(seq 1)
	(st 2))

(midi-note-channel-multi
	(wr fish (reset (walk 50 (ch 5 7 -12 2)) (st 50) (st 5)))
	(ch 1 2 3)
	(st 80)
	(st 4) 
	(seq 3 (latch (st 0) (st 8)) 1 (latch (st 0) (st 7)))
	(st 1))


(midi-note-channel-multi  
	(+ (rd fish) (st 12))
	(ch 0.1)
	(st 80)
	(st 5) 
	(seq 1)
	(st 1))  






