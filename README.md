### Cisp is a simple (scheme inspired) interpreter that translates "Cisp" code into ChucK code.

Cisp is my live coding tool that is specifically targeted at:
1. Non-standard synthesis (the use of compositional techniques directly on generating waveforms).
2. Algorithmic composition generating live Midi or OSC output.

# Requirements

[ChucK Command Line](http://chuck.cs.princeton.edu/release/)<br>
[My chugins](https://github.com/casperschipper/chugins) (specifically: Linseg, DelayC)<br> 
[My chuck Tools](https://github.com/casperschipper/ChucK-Tools)<br>
Python

My live coding sessions are set up like this:

Cisp.py takes a scheme like input file (example.lisp), and translates it to a chuck file (output.ck), which is added to the chuck virtual machine (by Cisp). Output.ck is not in "vanilla" chuck, it is using my Chuck-Tools library and chugins (for non-standard synthesis).

You will need to start chuck in loop mode, with my chugins and tools loaded, something like this:

`chuck --loop --chugin-path:yourChuginPath ~/pathToChuckTools/tools.ck`

# Using sublime build script

To make coding faster, I use a build scripts wich runs the .lisp file into cisp.

# Basic syntax

## non-standard synthesis

(step-gen [amp] [number-of-samples])


* white noise

	(step-gen 
  		(rv -1 1) // random value
  		(st 1)) // one sample constant value


* very fast sequencer

	(step-gen
  		(seq -1 1) // seq loops through a list ad infinitum -1 1 -1 1 -1 1 etc..
  		(seq 10 11 12 11 100 1100)) 

* gendy like

	(fun amp
		(bounded-walk -1 1 (ch -0.01 0.01))) // bounded-walk min max step

	(fun tim
		(bounded-walk 1 100 (ch -1 1))) // this is time steps

	(step-gen
		(seq amp amp amp amp)
		(seq tim tim tim tim)) 



(t
	(seq 10 20 30)
	(ch 1 2 3 5))

### easy bus

(~ casper (rv 1 100)) creates a bus

(~ casper) to read back the bus somewhere else (note, these are completely global)

### define table

(# casper (fillf 32 0 128))

### write to table

(~ foo (write casper (count 128) (rv 1 128))

which can be scheduled as

(schedule foo (st 0.5)) // which means that foo gets written every 0.5 seconds

video demo's will follow soon !


