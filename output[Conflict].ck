

fun void shred_1() {
PulseFeedbackSynth s => Safe safe =>Pan4 p => dac;

s.init(
    st.seq([-1,1])
,
    st.seq([1,44,88,44100])

);

p.pan(
  st.st(0.0));

day => now;
}
spork ~ shred_1();

day => now;