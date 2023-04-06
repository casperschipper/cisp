
(channel-synth
 (st 1)
(t (ch 10 1 3 7 100 2 3 1000 1500 10000) (fractRandTimer (ch 0.01 0.1 0.2 0.3 1.0)))
(st 0.4)
(hold (rv 0 12) (t (ch 10 1 3 7 100 2 3 1000 4000) (fractRandTimer (ch 0.01 0.1 0.2 0.3 1.0))))
)