(# pitch1 (collect (mtor (seq 0 3 5 7 10 12)) 6))
(# pitch2 (0.06125 0.125 0.25 0.5 1 2 4 8 16 32 64 ))

(schedule 
	(write
		pitch1
		(mtor (/ (floor (rv 0 24)) 2))
		(rv 0 6))
	(st 0.5))

(~ range
	(line
		(ch 0.1 1.0)	
		(ch 3 7)))

(fun indexer
	(loop 
		(line 
			(seq (* -1 (~ range)) (~ range))
			 (st 1)) (st 4) (st 4)))

(sci2 
voiceflat
(st 0.01)
:freq (* 500 (mup-mod-index pitch2 pitch1 indexer))
:duration (/ 1 (line (seq 0.1 4) (ch 2 4)))
:amp (st 0.01)
:pan (line (rv -1 1) (rv .1 .20))
)