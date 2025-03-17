(~ timer (st 0.3))

(~ pitch
	(st 60))

(~ velo (st 90))

(~ dura (st 0.9))


(midi-note-channel 
	(~ timer)
	(~ pitch)
	(~ dura)
	(~ velo)
	(st 1))