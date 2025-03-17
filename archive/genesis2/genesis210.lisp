(step-gen 
    (index
        (list
            (hold (rv -.1 .1) (ch 1 2 4 5))
            (hold (seq -1 1) 
                (t 
                (reset 
                    (mup-walk 100 (ch 0.5 1.0))
                    (st 100) 
                    (st 100))
                (st 0.1))
            (bounded-walk -1 1 (ch -0.01 0.01))
        )
        (t (count 3) (st 1)))
    (st 1)
    )