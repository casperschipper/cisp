

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.seq([-1.,1])
,
    st.st(100)

);




day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;