# CISP

Cisp is a python program that takes a scheme-like input program and translates it into ChucK code.
The ChucK code generated is using my "Chuck-Tools" classes and functions:

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

The fundamental object within Cisp is the Stream [^1]. A stream is an object with a .next() method, that returns a single float value. Cisp can either produce sound by sequencing using a stream to generate a series of amplitude values, MIDI messages or [OSC](http://opensoundcontrol.org/introduction-osc) messages to control other music programs. 

Cisp expressions are written as *s-expressions*

`(function-name arg1 arg2 arg3 ..)`

The arg1, arg2 etc..  can themselves be cisp expressions.

The simplest way to generate sound with CISP, is using the step-gen:

`(step-gen amp samps)`

Step-gen generates a step-like audio signal where time is in samples. Both amp and samps are controlled by streams.

So to create a square wave signal:

`(step-gen (seq -1 1) (st 100))` 

`seq` is a stream that takes a number of arguments and steps through them in order:

`-1 1 -1 1`

`st` is a stream that always returns the same value.

## Why not vanilla ChucK ?

ChucK is a powerful live coding language as is, I found however that in live coding (or composing), I sometimes got tangled up in my own abstractions. I somehow wasn't really able to reach the level of abstraction I needed, and having Cisp in between allows me to customize the syntax, while still being able to use the big library of functions I've collected over the years. It especially allows to mix float values with streams, and automatically converts arrays so they are all the same type (even if mixed).

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

Latch is only useful in combination with index, seq or other list based streams. Normally if you have a list of streams,
one value is returned and the container stream updates itself:

	> (seq (rv 1 10) (rv 99 103) (rv 1000 1011))
	
3 103 100

With latch:

	> (seq (latch (st 99) (st 3)) (st 10)) results in

99 99 99 10 99 99 99 10

### timed *or* t

__arguments:__

- input 
- interval

Timed is a sample and hold stream. It will repeat a value from a stream until interval time has passed.

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


### sometimes

- arg x
- arg y
- arg p

This is a convenience method for generating streams that mostly return one value, but sometimes another (x). P is the amount of y's in the vase compared to 1 x.
Example (sometimes 42 99 3) means that the stream is 3 times more likely to return a 99 then 32.

### ftom mtof 

Convert between frequency and midi

### index-lin

Index a array of streams, but interpelate if index has a value behind the comma.

### lookup

Treating an array as a wavetable

### walk

- initial 
- step

Create a stream that returns its previously returned value plus step.
For example: walk 10 (seq -3 4) will return 7 11 8 12 etc..

### mup-walk

- initial 
- step

Create a walk, but instead of add, one multiplies the value. It was named after the MUP generator of the analog studio in Sonology.


### bounded-walk

- lower
- higher
- step

Walks around, but will jump to the opposite boundary when hit a wall.

### bounded-mup-walk

A bounded mup walk

### bouncy-walk

Reverses next step if it was going to hit a wall.

### list-walk

Indexing a list using a walk.

### reset

- walk
- source
- repeat

### mod-index

Index two different tables with one input.
it is similar to a slide over the keys on a piano.
the pitch classes repeat throughout the octaves 
so table1 can be seen as pitch classes while table2 is the octaves.

Pseudocode:
divide the signal through number of cycles
remainder is index for table1
actual result is used as index for tabel2
sum both
    
### weights

weighted choice, format:

((value1 weigth1) (value2 weight2) (value3 weight3) etc..

### sync 

Synchronizes the next piece of code to a gridvalue

(now % value) => now;

### count

- max

simple counts up to max than starts at zero again.

### count2

counts up to max, but it latches automatically until it finished, for example:

(seq (count2 3) (st 99))

will result in:

	0 1 2 99 0 1 2 etc..
	
### loop

input
loopsize
number of loops

Loops streams.

	1 2 3 1 2 3
	
### delayi 

linearely interpolated delay.

### delay

1 2 3 4 5 6 7 8 9 10

### fractRandTimer 

This is shorthand for a common pattern, to generate random timings.

*simple random values*
(ch 0.1 0.2 0.5)

*random value, that is updated at random intervals*
(t (ch 0.1 0.2 0.5) (ch 0.1 0.2 0.5))

*random value, that is updated at random intervals, which are themselves updated at random intervals*
(t (ch 0.1 0.2 0.5) (t (ch 0.1 0.2 0.5) (ch 0.1 0.2 0.5)))

### guardedWalk

Guards are inspired by guard like functions in Haskell. In Haskell, a function can evaluate to certain alternatives based on a guard function (a test that returns true or false), for example:

f x 
  | (x < 10) = 10
  | (x > 100) = 100
  | otherwise = x

This is a signal clipper, where it cannot get lower than 10 or higher than 100, if in between it just returns the input.

In CISP, guards are used within walks (iterative functions) and instead of returning a value, a curried function is returned to apply to the current value. It is thus a generalization of walks or mup-walks. 

For example

(guardedWalk 100
	((| (< 10) (* 2))
	 (| (> 2000) (/ 2))
	 (otherwise (* (ch 0.5 2.0))))
	 )

would practically result in a bounded-mup-walk.













	







[^1]: I was heavily inspired by G.M. Koenig & Paul Bergs [SSP](https://www.jstor.org/stable/3679439?seq=1) & Luc Döbereiners [comp-scheme](http://sonology.org/wp-content/uploads/2019/10/structuring-symbolic-spaces.pdf).
