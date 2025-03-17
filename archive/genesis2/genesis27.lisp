(step-gen 
    (index
        (list
            (rv -.1 .1)
            (hold (seq -1 1) (st 100))
            (bounded-walk -1 1 (ch -0.01 0.01))
        )
        (t (count 3) (st 1)))
    (st 1)
    )