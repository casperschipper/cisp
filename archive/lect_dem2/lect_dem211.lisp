(midi-note-channel
	(~ tim)
	(~ pit)
	(~ dura)
	(~ velo)
	(st 1))

// this is a basic midi generator in CISP.
// It has four parameters, time, pitch, duration, velo

(~ tim (st 0.25))

(~ pit 
	(+ 60
		(seq 
			(series 72 60 67)
			(series 55 60 65)
			(series 70 62 64))))



