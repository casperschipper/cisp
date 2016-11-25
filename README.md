# This will be a library alowing you to use a Scheme like syntax to do 
non-standard synthesis.

For example

(step-synth 
  (rv -1 1) 
  (st 1))

(step-synth
  (seq -1 1)
  (seq 10 11 12 11 100 1100))

