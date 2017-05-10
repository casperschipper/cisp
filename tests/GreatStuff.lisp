/* create table */
(# table (fillf 2 1 100))
(# amps (fillf 16 -1 1))

/* procedure def, updates table */
(procedure casper 
	(# table (collect (ch 2 4 40 (st (rvi 1 100))) (chi (list 4 100 200)))))

(procedure fillAmp
	(# amps (collect (rv -1 1) (chi (list 2 4 16 32)))))

/* schedule a def */
(schedule casper (ch 1 2 4))

(schedule fillAmp (ch 0.333 1 2 4))

(clone
(step-gen 
	(seq amps)
	(list-walk table (hold (ch -1 1) (t (ch 1 20 50 100 10000) (ch 0.01 0.2 0.5 1.0)))) :pan)
1)x