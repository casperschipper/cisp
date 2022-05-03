// HELLO WORLD! I am Casper, this is my lisp based synthesis language, cisp!

// I use this language to synthesize sound from the sample level. 
// It has been a while, so please be patient :-) !

(sync 0.5)

(fun stepper
	(t 
	(seq 1 -1)
	(t 
		(ch 0.001 0.1 0.2 0.3 0.5 0.7 1.0)
		(ch 0.001 0.1 0.2 0.3 0.4 1.0))))

(fun amp
	(line
		(seq 0 1)
		(ch 3 4 6)))

(step-gen
	(* (hold (list-walk (fillf 2 -1 1) stepper) (t 
		(reset 
			(mup-walk 50 (ch 1.33333333 1.5 0.5 2))
			(st 50)
			(st 10))

			(ch 6.0 12 3 0.5))) amp)
	(st 1) // this is time in samples
	:pan (rvfi -1 1)
	)


