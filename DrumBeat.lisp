(sync 0.14)

(sci2 
	kick 
	(hold (seq 0.08 0.16 0.32) (ch 3 4))
	:duration (hold (seq 0.1 0.15 0.8) (seq 1 1 1 1 2 1 1))
	:amp (hold (seq 0.2 0.3 0.1 0.1 0.5) (ch 1 2 1 1 1 3))
	:maxfreq (seq 30 (seq 100 80 40 100))
	:lowFreq (seq 10 20 30 10)
	)
