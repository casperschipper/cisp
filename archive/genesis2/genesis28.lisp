(step-gen 
    (index
        (list
            (hold (rv -.1 .1) (ch 1 2 4 5))
            (hold (seq -1 1) (st 100))
            (bounded-walk -1 1 (ch -0.01 0.01))
        )
        (t (count 3) (st 1)))
    (st 1)
    )