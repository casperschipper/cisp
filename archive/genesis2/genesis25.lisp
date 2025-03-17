(step-gen 
    (index
        (list
            (rv -1 1)
            (line (seq -1 1) (ch 0.1 0.2 0.03))
            (bounded-walk -1 1 (ch -0.01 0.01))
        )
        (t (count 3) (st 1)))
    (st 1)
    )