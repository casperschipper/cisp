# Cisp 

__C__asper's __I__nstant __S__ound __P__rograms

*cisp is a simple (scheme inspired) interpreter that translates "Cisp" code into ChucK code*

Cisp is my live coding tool that is specifically targeted at:
1. Non-standard synthesis (the use of compositional techniques directly on generating waveforms).
2. Algorithmic composition generating live Midi or OSC output.

[video demo](https://www.casperschipper.nl/v2/uncategorized/a-few-noisy-etudes-in-cisp/)

## Requirements / Setup

### Install Chuck

You can just use the official installer, https://chuck.stanford.edu/release/
Or use homebrew 

`brew install chuck`

### Fetch CISP dependencies

CISP relies on a set of classes I wrote for Chuck ("Chuck-Tools"), and a bunch of personal "Chugins", which are audio-rate plugins for chuck.

You can fetch both by just grabbing the submodules:

git submodule update --init --recursive
This will fetch [chuck-tools](https://github.com/casperschipper/ChucK-Tools) and [chugins](https://github.com/casperschipper/chugins). 

Naturally you will need to have installed git to be able to do this (on mac, I again recommend using Homebrew for this).

### Build my chugins.

Cisp uses a number of custom unit generators, known in ChucK as *"chugins"*.
You will need to build them from source. The most important are Buffer, Clip and Linseg.

1. Within the CISP folder, go to `cd submodules/chugins`
2. make `make mac|windows|linux`
3. install them with `sudo make install`

I am currently using ChucK version 1.5.5.0.
A common error happens when sometimes the API of Chugins is updated to a new version, and is different from the version of ChucK you have installed. You will see a warning when you try to run ChucK with my chugins. To see those errors you need to run ChucK in verbose mode: `chuck --verbose:5`.
In this case you will need to fetch the updated version from https://github.com/ccrma/chugins so you have the correct up-to-date headers (the /chuck folder). In some cases you may even need to change some code (if they drastically change the API for chugins :-). But in most cases my chugins are rather simple.

### Live coding setup

Good you are now ready to test CISP.

To run a CISP program, we will want to start the ChucK virtual machine, with the chugins and __chuck-tools__ classes loaded.
I do this on my own machine with the following:

`chuck --bufsize:1024 --loop --chugin-load:auto --chugin-path:/usr/local/lib/chuck --verbose:1 ~/devel/chuck/cisp/submodules/chuck-tools/tools.ck`

You should see a whole bunch of classes being loaded in the virtual machine.
You only want to see green lines in the prompt, no orange or red.
<span style="color:red">watch out: paths can be case sensitive!!!</span>

You will want to replace ~/devel/chuck/cisp with your own location to where you cloned the CISP repo.

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
`cisp.py -i test.lisp -o output.ck -c +`

Run a script, but remove anything that is running already  
`cisp.py -i test.lisp -o output.ck -c all`

Replace the last added script  
`cisp.py -i test.lisp -o output.ck -c replace`


# Using sublime build script or visual studio code:

While live coding, I use build-scripts of my code editor (sublime text) to send the .lisp code to the cisp.py script. 
You can find the example setup as cisp.sublime-build, although you will have to adjust paths to your own system.

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





