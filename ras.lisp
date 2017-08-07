(# cas (collect (rv -.1 .1) 128))

(fun casper (seq cas))

(step-gen
(bounded-walk -1 1 (* casper (st -.1)))
(st 1))

(fun casper2 (* (seq cas) (weights ((1 1000) (-1 1)))))

(clone
(step-gen
	(bounded-walk -1 1 (* casper2 (st -1)))
	(st 1) :pan -1)
2)

