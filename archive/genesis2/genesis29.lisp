(step-gen 
    (index
        (list
            (hold (rv -.1 .1) (ch 1 2 4 5))
            (hold (seq -1 1) (t (mup-walk 100 (ch 0.5 1.0)) (ch 0.1)))
            (bounded-walk -1 1 (ch -0.01 0.01))
        )
        (t (count 3) (st 1)))
    (st 1)
    )