(# tab1 (fillf 1 0 0))

(step-gen
   (* 0.01 (write tab1 
      (bounded-walk 0 100 
         (bounded-walk 0 100
            (index-lin OSC.table4 (+ (seq tab1) (line (ch 0.0 1) (ch 1 2 3 4 5))))))
      (st 0)))
   (st 1)
   :pan (rvfi -1 1))