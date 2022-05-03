/* outpport inport pitch dur velo channell delta 

(~ deltaBus (st 0)) 

(midi-sync
	9
	9
	(index OSC.table1 (clip (- (~ midi-pitch-in) 60) (st 0) (~ tableMax)))
	(st 2.0)
	(st 100)
	(st 1)
	(~ deltaBus)
	)

