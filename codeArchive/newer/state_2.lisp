(# amp 
    (fillf 24 -1 1))

(fun b
    (line
    (seq 0 24)
    (rv 10.0 20)))

(fun a 
    (line 
        (seq b b)
        (st 1)))

(step-gen
    (index amp
        (statemachine 
        (list 
            a a a a a a a a a a a a a a a a a a a a a a a a))
    )
    (st 20)
    :pan 0.)


 
