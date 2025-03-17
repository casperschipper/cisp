(step-gen 
    (index
        (list
            (rv -1 1)
            (line (seq -1 1) (ch 0.1 0.2 0.03))
            (bounded-walk -1 1 (ch -0.01 0.01))
        )
        (hold (ch 0 1 2) (ch 1 2 3 4 5 100)))
    (st 1)
    )