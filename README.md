### Cisp is a simple (scheme inspired) interpreter that translates "Cisp" code into ChucK code.

Cisp is my live coding tool that is specifically targeted at:
1. Non-standard synthesis (the use of compositional techniques directly on generating waveforms).
2. Algorithmic composition generating live Midi or OSC output.

[video demo](https://www.casperschipper.nl/v2/uncategorized/a-few-noisy-etudes-in-cisp/)

[performance at Segmod event]

# Requirements / Setup

[ChucK Command Line]https://github.com/ccrma/chuck<br>

Build chuck:
1. Clone the chuck repo
2. `make osx|windowns|linux`
3. `sudo make install`

*installing the binary version seems to cause a conflict with the chugins, so build from source.*

Build my chugins:
1. [My chugins](https://github.com/casperschipper/chugins-2019) (specifically: Linseg, DelayC)<br> 
2. `make osx|windows|linux`
3. `make install`

Clone my tools:
[My chuck Tools](https://github.com/casperschipper/ChucK-Tools)<br>

__My live coding sessions are set up like this:__

Cisp.py takes a scheme like input file (example.lisp), and translates it to a chuck file (output.ck), which is added to the chuck virtual machine (by Cisp). Output.ck is not in "vanilla" chuck, it is using my Chuck-Tools library and chugins (for non-standard synthesis).

You will need to start chuck in loop mode, with my chugins and tools loaded, something like this:

`chuck --loop --chugin-path:yourChuginPath ~/pathToChuckTools/tools.ck`

yourChuginPath is probably /usr/local/lib/chuck 

# Using sublime build script

To make coding faster, I use a build script wich runs the .lisp file into cisp.

# Basic syntax

## non-standard synthesis


`(step-gen [amp] [number-of-samples])`


* white noise *
<pre>
	(step-gen 
  		(rv -1 1) 
  		(st 1))</pre>


* very fast sequencer
<pre>
	(step-gen
  		(seq -1 1) // seq loops through a list ad infinitum -1 1 -1 1 -1 1 etc..
  		(seq 10 11 12 11 100 1100)) 
</pre>
* gendy like

<pre>
	(fun amp
		(bounded-walk -1 1 (ch -0.01 0.01))) // bounded-walk min max step

	(fun tim
		(bounded-walk 1 100 (ch -1 1))) // this is time steps

	(step-gen
		(seq amp amp amp amp)
		(seq tim tim tim tim)) 
</pre>

<pre>
(t
	(seq 10 20 30)
	(ch 1 2 3 5))
	
</pre>

### easy bus


`(~ casper (rv 1 100))` creates a bus

`(~ casper)` to read back the bus somewhere else (note, these are completely global)

### define table

`(# casper (fillf 32 0 128))`

### write to table

`(~ foo (write casper (rv -1 1) (count 128))`

The arguments for write are: table name, value generator, write index into the table.

which can be scheduled as
`(schedule (~ foo) (st 0.5))` // which means that foo is executed each 0.5 seconds

You can also use a more direct notation, for example:

(samp-schedule ARG1 ARG2)

evaluates its ARG1 stream each ARG2 samples.

`(samp-schedule 
	(write casper (rv -1 1) (count 128)) 
	(st 1))
`





