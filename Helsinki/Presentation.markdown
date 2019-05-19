% Cisp
% Casper Schipper
% May 17th 2019

# Inspiration:

## Historic

* Paul Berg AC Toolbox & G.M. Koenig SSP
![ac-toolbox](screenshot-actoolbox.png)

* Luc Döbereiner's CompScheme


# Soundwise

* Michael Chinen "f\*cking webbrowser"
<iframe title="vimeo-player" src="https://player.vimeo.com/video/9635993" width="640" height="480" frameborder="0" allowfullscreen></iframe>
* Philips 
<https://soundcloud.com/gerard-alberts/sets/philips-technisch-tijdschrift>

# ChucK

* strong timing
* sample accurate
* all structure controlled in same language: synthesis, control and events
* simple language


# basic concept

Stream = object that has a next() function

## to create sound I use two streams

* amplitude 
* time

# First try:

Stream (as objects in ChucK)

Lot's of objects 

# Issues

* Mixing values and functions not possible
* Chuck has some quirky rules for arrays
* (new MyFancyObject).make(arg,arg,arg) is not pretty
* I don't like typing comma's for just a bunch of numbers, often even the numbers are zeros.

# I was suggested to write my own language

# creative coding Utrecht
[Rik Arends](https://twitter.com/rikarends)

# Second try: Cisp

# Heretical 

Cisp -> Python -> Chuck -> output

* For my Cisp compiler I used a tiny scheme interpreter
<https://norvig.com/lispy.html>

# advantages

* common patterns, short code
* lot's of implicit stuff becomes default (compare Drate Ugens)
* operator overload!
* easy rewrite
 
# examples
* Aleatoric 
* Tendency masks
* Gendy
* Iterative functions

# other stuff

* nested "sections"
* functions
* busses
* indexing
* walks that have control of the steps
* guardedWalks
* read and write




Summary:
========

I have tried to create an interface through Python for ChucK that makes it as easy as possible to write on the sample level.
Points I want to make:
 
* Parsers/translators are not as hard as I thought !
* Slowness has not been so troubling
* Generic functions are the most productive

# Thank you

www.casperschipper.nl



# Questions:
* Writing a parser in Haskell
* Named arguments, better self-documenting of code
* Compile directly to C/Rust/Faust ?

# References

[1] = A Procedural Control Language for a Digital Signal Processor

[2] = SSP and Sound Description
Author(s): Paul Berg, Robert Rowe and David Theriault
Source: Computer Music Journal, Vol. 4, No. 1 (Spring, 1980), pp. 25-35 Published by: The MIT Press
Stable URL: https://www.jstor.org/stable/3679439


