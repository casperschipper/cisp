(fun a 
	(t
		(rv 0 128)
		(ch 1 2 4 .1 8 16)))

(fun b
	(line 
		(rv 1 1000)
		(ch 1 2 5 7)))

(channel-synth
(hold 
	(reset (mup-walk 10 (ch 0.5 0.25 2.0 4.0)) (st 10) (ch 1 2 8 16 32))
	(st 10))
(t (seq 1 100) (ch .1 .3 1 7))
(seq (latch (st 0) (seq b b)) (st 0.9))
(* (+
	(index OSC.table1 (line (seq a a) (st 0.1))) 1) 11))