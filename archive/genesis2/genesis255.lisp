(# table1 (collect (bounded-walk -0.01 0.01 (ch -0.01 0.01)) 10000))

(# mem (fillf 1 0 0))



(step-gen
    (write 
        mem 
        (bounded-walk -1.0 1.0 
            (bounded-walk -1 1
                (index-lin table1 
                    (* (+ 100 (index mem (st 0))) -1000))))
        (st 0))
    (st 1))


