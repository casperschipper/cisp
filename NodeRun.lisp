// node(int size,float amp, float pan,Stream outArg,Stream durArg,Stream topArg,Stream timerArg, Stream recordArg, Stream inputArg,Stream fundArg)

(reset-node)

(fun recflag
	(t 
		(ch 0 0 0 1)
		(ch 0.1 1.0 2.0 3.0)))

(fun dura
	(ch 0.1 0.2 0.3 1.0 7.0))

(fun a 
	(t 
		(seq 1 2 3 4 5 6)
		(ch .1 .2 .4 .5)))

(fun freqr
	(t 
	(* (/ a a) 100)
	(rv 1 2)))

(fun top
		(ch 0.01 10.0 20.0 0.001 0.0002 0.003))

(fun timer
	(ch 0.1))

(node 18 -1.0 -1.0 (rv 0 5) dura top timer recflag (audioIn (st 0)) freqr)

(node 256 -0.5 -1.0 (rv 0 5) dura top timer recflag (audioIn (st 0)) freqr)

(node 128 0. -1.0 (rv 0 5) dura top timer recflag (audioIn (st 0)) freqr)

(node 64 0.5 -1.0 (rv 0 5) dura top timer recflag (audioIn (st 0)) freqr)

(node 192 1.0 -1.0 (rv 0 5) dura top timer recflag (audioIn (st 0)) freqr)

(node 10000 0.001 -1.0 (rv 0 5) dura top timer recflag (audioIn (st 0)) freqr)

