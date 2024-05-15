(midi-note
(beat 120 4)
(hold (+ 36 (seq 9 7 5 2 0)) (hold (index (list 1. 3 5 7 9) (rv 0 (slider 1 1 7))) (slider 1 1 1)))
(st 0.5)
(slider 1 1 4))

(sci2
	casper
	(beat 120 4)
	:midi (hold (+ 36 (seq 9 7 5 2 0)) (hold (index (list 1. 3 5 7 9) (rv 0 (slider 1 1 7))) (slider 1 1 1)))
	:velo (slider 1 1 4)
	:duration (st 0.5))

(midi-note
(beat 120 4)
(hold (+ 36 (seq 9 7 5 2 0)) (hold (hold (index (list 1. 3 5 7 9) (rv 0 (slider 1 1 8))) (slider 1 1 2)))
(st 0.5)
(slider 1 1 5))

(midi-note
(beat 120 4)
(hold (+ 36 (seq 9 7 5 2 0)) (hold (index (list 1. 3 5 7 9) (rv 0 (slider 1 1 9))) (slider 1 1 3)))
(st 0.5)
(slider 1 1 6))
