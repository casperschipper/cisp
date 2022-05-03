/* outpport inport pitch dur velo channell delta 

(midi-sync
	9
	9
	(index OSC.table1 (- (~ midi-pitch-in) 60))
	(st 1.0)
	(index (list 100 50) (modulo (- (~ midi-pitch-in) 60) 2))
	(st 1)
	(st 0)
	)

