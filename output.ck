

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.seq([-1.,1])
,
    st.ch([1.,2,4,8,16,64])

);




day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;ShredEventStack stack;
ShredEvent end;
stack.push(end);
end => now;