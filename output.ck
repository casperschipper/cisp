

fun void shred_1() {
StepSynth s => Safe safe => dac;
<<<"casper">>>;

s.init(
		st.seq(OSC.table1)
,
		st.st(10)

);



day => now;
}
spork ~ shred_1();

day => now;