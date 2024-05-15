(sync 0.2)

(fun pitch
    (t 
     (bounded-mup-walk 0.1 256.0 (ch 1.25 1.5 0.75 2 0.5 0.25 0.99))
        (ch (grow 0.1 1.5 6))))

(clone
(step-gen
    (index-lin (fillf 32 -1 1) (walk 0 pitch))
    (st 1)
    :pan (rvfi -1 1))
10
)
