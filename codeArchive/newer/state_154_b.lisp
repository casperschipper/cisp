(# amp
    (fillf 8 -1 1))


(clone
(step-gen
    (index (fillf 8 -1 1)
        (statemachine 
        (list 
            (st 1)
            (st 2)
            (hold (seq 3 0) (rv 100 222))
            (st 4)
            (st 5)
            (hold (seq 6 0) (rv 1 333))
            (st 0))))
    (st 2)
    :pan (rvfi 0 1))
10)
