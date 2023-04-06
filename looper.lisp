(# mem (alloc 44100))

(samp-schedule
(write mem (dacin 0) (count (table-cap mem)))
(st 1))

(step-gen
(* (list-walk mem) 2)
(st 1))