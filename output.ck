
cs.sync(0.140000000000);


st.bus(
st.rv(0,
    st.midiCtrl(2)),"stepsize");



fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.indexLin(OSC.table1,
        st.linlin(
            st.midiCtrl(2),0,128,2,3))
,
    st.st(1)

);



day => now;
}
spork ~ shred_1();

day => now;