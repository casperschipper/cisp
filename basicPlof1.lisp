(fun a 
	(line
		(seq 0 128)
		(ch 1 2 4 .1 8 16)))

(channel-synth
(reset (walk 0 (st 50)) (ch 10 20 30) (st 20))
(line (seq 1 100) (ch .1 .3 1 7))
(st 0.5)
(* (+
	(index OSC.table1 (line (seq a a) (st 0.5))) 1) 8))