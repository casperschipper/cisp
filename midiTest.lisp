(midi-note
(t (seq 0.01 1.0 2.0 0.2 0.4 0.5) (ch .1 .4 .6 2))
(loop (rv 0 100) (ch 2) (ch 2 3 4))
(st 0.5)
(st 100)
)