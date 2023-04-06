(fun a 
	(hold 
		(reset (walk 60 (ch (seq 3 4 7) (seq -4 -3))) (st 60) (st 4))
		(st 7)))

(fun b
	(hold 
		(list-walk (72 74 75 77) (ch -1 1))
		(st 5)))

(fun c 
	(hold 
		(seq 60 65 70 55 50 60)
		(st 11)))


(fun v 
	(line 
	(seq 40 70 100)
	(rv 1 7)))

(midi-note-channel-sync
	(seq a b c a b a a b c)
	(st 0.05)
	(seq v v v)
	(st 2))