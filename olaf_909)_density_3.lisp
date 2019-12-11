/* block 
This is a set of programs written for a jam with Olaf
Approach was to use the amplitude as the main means of expression
*/

(~ tempo (st 0.13))

(fun onevelo 
	(hold 
		(ch 40 90 50 100 60 120) 
		(hold 
			(ch 1 2 (ch 1 2 3 2 1 2 2 1 3))
			(seq 3 5 (ch 4 4 4 4 4 4 4 4 4 4 5)))))



(midi-note
	(~ tempo)
	(st 36)
	(st 0.05)
	(seq onevelo onevelo onevelo onevelo onevelo onevelo)
	)


(midi-note
	(~ tempo)
	(st 44)
	(st 0.05)
	(linlin (seq onevelo onevelo onevelo onevelo onevelo) (st 0) (st 128) (st 80) (st 110))
	)

(midi-note
	(~ tempo)
	(st 38)
	(st 0.05)
	(seq (ch 90 120 128) (latch (ch 50 50 50 50 50 50 128) (st 4)) (st 0) )
	)


(fun wolk
	(line
		(seq 1 300)
		(ch 2 4)))

/* this is the most interesting part:
   I am deviding tempo into 60.

   */


(clone
(midi-note
	(/ (* (~ tempo) 4) 60)
	(loop (hold (hold (ch 43 45 47) (st 50)) (sometimes 1 2 30)) (st 4) (st 3))
	(st 0.05)
	
	(seq
		(loop (latch (sometimes (st 100) (st 0) wolk) (st 59)) (st 4) (st 8))
		(seq (st 100) (latch (ch 50 50 50 50 50 50 128) (st 4)))
	)

	) 4)