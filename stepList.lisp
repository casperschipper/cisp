(~ stepper
(line (seq 1.0 1.01) (ch 0.1 1 4 8))
)

(step-pan-gen
(index-lin OSC.table1 (bounded-walk 0 128 (~ stepper)))
(st 1)
(index-lin OSC.table1 (bounded-walk 0 128 (~ stepper)))
)