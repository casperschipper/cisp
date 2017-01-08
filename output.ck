

fun void shred_1() {
StepSynth s => Safe safe => dac;

s.init(
  st.rv(-1,1)
,
  st.st(100)

);

day => now;
}
spork ~ shred_1();

day => now;