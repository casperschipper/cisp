(# pitch1 
    (sine 12 (1.0)))

(fun b
    (line
    (seq 0 24)
    (rv 1 10)))

(fun a 
    (line 
        (seq b b)
        (ch 0.1 0.5 1.5)))

(midi-note-channel 
    (st 0.12)
    (index pitch1
        (statemachine 
        (list 
            a a a a a a a a a a a a))
    )
    (st 0.15)
    (st 64)
    (st 1))

