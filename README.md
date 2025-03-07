# Cisp 

__C__asper's __I__nstant __S__ound __P__rograms

*cisp is a simple (scheme inspired) interpreter that translates "Cisp" code into ChucK code*

Cisp is my live coding tool that is specifically targeted at:
1. Non-standard synthesis (the use of compositional techniques directly on generating waveforms).
2. Algorithmic composition generating live Midi or OSC output.

[video demo](https://www.casperschipper.nl/v2/uncategorized/a-few-noisy-etudes-in-cisp/)

## Requirements / Setup

Before you can run CISP, you need to install a couple of dependencies. 

### 1. Install Chuck

You can just use the official installer, https://chuck.stanford.edu/release/
Or use homebrew 

`brew install chuck`

### 2. Build my chugins.

Cisp uses a number of custom unit generators, known in chuck as *"chugins"*
1. Clone this repo: [https://github.com/casperschipper/chugins](https://github.com/casperschipper/chugins)
2. `make mac|windows|linux`
3. `sudo make install`

Note: sometimes the API of Chugins is changed, you will see a warning when you try to run chuck.
In this case you will need to merge the chugin repo with from https://github.com/ccrma/chugins so you have the correct up-to-date headers (the /chuck folder).

### 3. Download the "Chuck-Tools"

You will also need to fetch a bunch of Chuck classes, which are collected in my repo Chuck-Tools [^1].
CISP uses a these classes in the generated code.
[My chuck Tools](https://github.com/casperschipper/ChucK-Tools)<br>
We can load these when we start the chuck virtual machine (see next point).

[^1]: In fact, cisp started life as this library, as I ran into limitations of syntax, I created the transpiler.

### 4. Live coding setup

To run a CISP program, we will want to start the ChucK virtual machine, with the chugins and __chuck-tools__ classes loaded.
I do this on my own machine with the following:

`chuck --bufsize:1024 --loop --chugin-load:auto --chugin-path:/usr/local/lib/chuck --verbose:1 ~/devel/chuck/tools/Tools.ck`

You should see a whole bunch of classes being loaded in the virtual machine.

Replace ~/devel/chuck/tools/Tools.ck with your own path to my __chuck-tools__.

You may need to adjust this, if you want to use a different audio device (see chuck --help & chuck --probe-devices).
It may also be that on windows or linux, the chugins are installed elsewhere.

Create new textfile and name it test.lisp

```lisp
(step-gen
   (seq -1 1)
   (ch 1 2 4 8 16 32))
```

You can now run cisp as follows:

Run a script (adding to anything that is running already)  
`cisp.py -i test.lisp -o output.ck -c run`

Run a script, but remove anything that is running already  
`cisp.py -i test.lisp -o output.ck -c all`

Replace the last added script  
`cisp.py -i test.lisp -o output.ck -c replace`


# Using sublime build script or visual studio code:

While live coding, I use build-scripts of my code editor (sublime text) to send the .lisp code to the cisp.py script. 

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





