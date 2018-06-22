### This will be a library alowing you to use a Scheme like syntax to do non-standard synthesis.

# requirements

chuck command line
my chugins (especially Linseg, DelayC)
(optional) sublime text 2

Cisp takes a scheme like input file (.lisp), and translates it to a chuck file (output.ck), which is added to the chuck virtual machine.

Cisp is using a lot of my Stream (ST_*) classes, which can be used to create supercollider events, or direct non standard synthesis.

Before using cisp, you have to start chuck in loop mode, for example like this:
chuck --chugin-path:/Users/[yourusername]/Library/Application\ Support/ChucK/ChuGins /Users/[yourusername]/Google\ Drive/ChucK/tools/Tools.ck --loop

# Using sublime build script

I use sublime text to edit the lisp input file (I simply use lisp format, since it is almost the same as my syntax) 
and to automatically run cisp.py 

# basic examples:

(step-gen [amp] [time])


* white noise

	(step-gen 
  		(rv -1 1) 
  		(st 1))


* very fast sequencer

	(step-gen
  		(seq -1 1)
  		(seq 10 11 12 11 100 1100))

* gendy like

	(fun amp
		(bounded-walk -1 1 (ch -0.01 0.01)))

	(fun tim
		(bounded-walk 1 100 (ch -1 1)))

	(step-gen
		(seq amp amp amp amp)
		(seq tim tim tim tim))



(t
	(seq 10 20 30)
	(ch 1 2 3 5))

### easy bus

(~ casper (rv 1 100)) creates a bus

(~ casper) to read



