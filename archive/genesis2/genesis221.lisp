(# table1 (fillf 16 -0.01 0.01))

(# mem (fillf 1 0 0))

(step-gen
    (write 
        mem 
        (bounded-walk -1.0 1.0 
        (bounded-walk -1.0 1.0
            (index-lin table1 
                (* (+ 1 (index mem (st 0))) 16))))
        (st 0))
    (st 1))