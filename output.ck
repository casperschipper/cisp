

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.lowpass(
        st.rv(-1,1),
        st.s(1000),
        st.s(10.0),
        st.s(300))
,
    st.s(1)

);




day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;ShredEventStack stack;
ShredEvent end;
stack.push(end);
end => now;