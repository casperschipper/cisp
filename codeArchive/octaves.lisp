(# pitch1 (fillf 32 0 3))
(# pitch2 (0.06125 0.125 0.25 0.5 1 2 4 8 16 32 64 ))

(fun indexer
	(line (seq (rv 0 1) (st 1))
		(fractRandTimer (ch 0.01 0.1 0.2 0.001))))

(schedule
	(write pitch1
		(reset (bounded-mup-walk 0.1 2.0 (ch (rv 0.5 1.9))) (st 1) (st 12))
		(count (table-cap pitch1))
		)
	(st .1))

(sci2 
voiceflat
(st 0.001)
:freq (* (* 220 (mup-mod-index indexer pitch1 pitch2 )) (rv 1.0 1.))
:duration (/ 1 (line (seq 0.01) (ch 2 4)))
:amp (st 0.01)
:pan (line (loop (rv -1 1) (st 10) (st 4)) (rv .1 .20))
)