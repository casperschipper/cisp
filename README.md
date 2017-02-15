### This will be a library alowing you to use a Scheme like syntax to do non-standard synthesis.

Use this for correct chugin-path

chuck --chugin-path:/Users/casperschipper/Library/Application\ Support/ChucK/ChuGins /Users/casperschipper/Google\ Drive/ChucK/tools/Tools.ck --loop


For example

(step-synth [amp] [time])

(step-synth 
  (rv -1 1) 
  (st 1))

(step-synth
  (seq -1 1)
  (seq 10 11 12 11 100 1100))

### easy bus

(~ casper (rv 1 100)) creates a bus

(~ casper) to read



