(# amp
    (fillf 8 -1 1))


(clone
(step-gen
    (index (fillf 8 -1 1)
        (statemachine 
        (list 
            (st 1)
            (st 2)
            (hold (ch 3 2) (line (seq 1 1000) (ch 0.1 0.3 0.4 1.0 2.0 3.0 5.0)))
            (st 4)
            (st 5)
            (hold (ch 6 0) (line (seq 1 3) (ch 0.1 0.3 0.4 1.0 2.0 3.0)))
            (st 0))))
    (st 2)
    :pan (rvfi 0 1))
10)
