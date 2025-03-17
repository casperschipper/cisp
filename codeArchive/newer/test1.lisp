// HELLO WORLD !
// I'll be live coding with CISP, a LISP dialect that generates chuck code.
// Today I will first be generating a bit of midi with it...

(~ tim (st 0.25))
(~ pitch (st 60))
(~ dura (st 1.0))
(~ velo (st 100))

(~ a (st 60))
(~ b (st 65))
(~ c (st 70))

(midi-note-channel
	(~ tim)
	(seq (~ a) (~ b) (~ c))
	(~ dura)
	(~ velo)
	(st 1))

(sync 0.25)
