(# table
(1. 2 3 4 5 6 7 33 11 100 200 300))

(fun a 
(line
(seq a (table-cap table))
(ch 10 5)))

(fun indexer
(rv a a))

(step-gen
(seq OSC.table9)
(index table indexer))