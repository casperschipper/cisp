# CISP

Cisp is a python program that takes a scheme-like input program and translates it into ChucK code.
The ChucK code generated is using classes and functions:

<https://github.com/casperschipper/ChucK-Tools>

## How to use

cisp.py arguments:

* -i your input file
* -o the output file (default is output.ck)
* --command 
  * + : add the shred to ChucK virtual machine
  * replace : replace the latest shred
  * panic : kill chuck
  * stop : stop current shred
  * all : replace all the shreds with the new one
  * oldest : drop the oldest, add the new
  
Personally, I use a sublime build script:

`cisp.sublime-build (can be found in the repo)`

## What is this about?

The fundamental object within Cisp is the Stream [^1]. A stream is an object with a .next() method, that returns a single float value. Cisp can either produce sound by sequencing using a stream to generate amplitude values, or you can generate streams of MIDI or [OSC](http://opensoundcontrol.org/introduction-osc) messages to control other music programs. 

Cisp expresssions are written as *s-expressions* (function-name arg1 arg2 arg3 ..) 
The arg1, arg2 etc..  can themselves be expressions.

The simplest way to generate sound with CISP, is using the step-gen:

`(step-gen amp samps)`

Step-gen generates a step-like audio signal where time is in samples. Both amp and samps can be controlled using streams.

To create a square wave:

`(step-gen (seq -1 1) (st 100))` 

`seq` is a stream that takes a number of arguments and steps through them in order:

`-1 1 -1 1`

`st` is a stream that always returns the same value.

## Why not vanilla ChucK ?

ChucK is a powerful language as is, I found however that in live coding (or composing), I sometimes got tangled up in my own abstractions. I somehow wasn't really able to reach the level of abstraction I needed, and having Cisp in between allows me to customize the syntax, while still being able to use the big library of functions I've collected over the years. It also allows mixing direct values (float literals), with function definitions, without having to deal with ChucK's array type rules.

# Stream types

## Sequencing
	
### seq

arguments: integer or float, bool

	> (test (seq 11 12 13))
    11 12 13 11 12 13

A single bool will put the **seq** into __holdmode__, where the stream will take over the container stream, until it went trough all its values, for example:

	> (test (seq 1 (seq 11 12 true) 2 3))
    1 11 12 2 3 1 11 12 2 3
	
	
### ch

arguments: integer or float

Randomly picking values with repetition:

	> (ch 1 2 3)
	3 2 1 2 1 2 3 2 2 2 1 1 2 3 1 2 2 3 3 1 
	
### series 

arguments: integer or float

Randomly picking values without repetition:

	> (series 1 2 3 4)
	1			3			4			2	
	4			3			1			2	
	3			2			4			2	
	1			2			4			4
	
__arguments:__

- array
	
### index

use a stream to index an array of other values or streams

	> (index (1 2 3 4) (rv 0 4))
	
__arguments:__

- array
- indexer
	
	

### latch

Latch is to be used in combination with index, seq or other list based functions.
When a stream is latched, it's container stream will return values from it until the number is reached.
For example:

	> (seq (latch (st 99) (st 3)) (st 10)) results in

99 99 99 10 99 99 99 10

### timed *or* t

__arguments:__

- input 
- interval

Timed is a sample and hold stream. It will repeat a stream until interval time has passed.

### line

__arguments:__

- input
- interval

Line is the interpolated version of timed. It makes linear segments that interpolate from a to b.

### rv

- lower boundary
- higher boundary

rv generates random values between low and high. 

### exprv

a rv variant where the third argument allows you to 

### operators: + / - * >> << & |

Stream versions of operators, the hold mode of the operants may influence the output.

	> (+ (seq 10 20 true) (seq 1 2 3))

vs

	> (+ (seq 10 20) (seq 1 2 3 true))




	







[^1]: I was heavily inspired by G.M. Koenig & Paul Bergs [SSP](https://www.jstor.org/stable/3679439?seq=1) & Luc Döbereiners [comp-scheme](http://sonology.org/wp-content/uploads/2019/10/structuring-symbolic-spaces.pdf).
