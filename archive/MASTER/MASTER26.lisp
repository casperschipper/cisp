(# table1 (collect (bounded-walk -0.01 0.01 (ch -0.01 0.01)) 10000))

(# mem (fillf 1 0 0))

(# mem2 (fillf 1 0 0))

(fun loop2 
    (write 
        mem2 
        (bounded-walk 1 2.0 
            (bounded-walk 1 2
                (index-lin table1 
                    (* (+ 100 (index mem2 (st 0))) 
                        (* -1 
                        (t 
                            (ch (rv 1 100) (/ 1.0 (rv 1 100000)))
                            (st 1.0)))))))
        (st 0)))

(fun alpha 
    (t 
        (ch (rv 1 100) (/ 1.0 (rv 1 100)))
        loop2))


(step-gen
    (write 
        mem 
        (bounded-walk -1.0 1.0 
            (bounded-walk -1 1
                (index-lin table1 
                    (* (+ 100 (index mem (st 0))) (* -1 alpha)))))
        (st 0))
    (st 30)
    :pan (rvfi -1 1)

    )


