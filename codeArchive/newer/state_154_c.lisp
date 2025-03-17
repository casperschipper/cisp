(# amp
    (fillf 8 -1 1))


(clone
(step-gen
    (index (fillf 8 -1 1)
        (statemachine 
        (list 
            (st 1)
            (st 2)
            (hold (rv 0 6) (rv 100 2202))
            (st 4)
            (st 5)
            (hold (rv 0 6) (rv 1 3330))
            (st 0))))
    (st 10)
    :pan (rvfi 0 1))
10)
