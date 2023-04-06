(sync 0.125)

(midi-note
(/ (st 0.125) (seq (latch (st 1) (st 10)) (latch (st 0.5) (st 1))))
(st 39)
(seq 1.0)
(seq (rv 100 127) (seq 40 20 30 10) (seq 10 40 80 20 10 100))
)

/* steve reicht ! */