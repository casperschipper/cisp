(# table1 (fillf 256 -0.001 0.001))

(# mem (fillf 1 0 0))

(step-gen
    (write 
        mem 
        (bounded-walk -1.0 1.0 
        (bounded-walk -1.0 1.0
            (index-lin table1 
                (* (+ 1 (index mem (st 0))) 32))))
        (st 0))
    (st 1))