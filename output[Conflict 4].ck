fun Stream estimate () {
return 
st.freqCount(
    st.audioIn(0),4410);
}

st.test(estimate());


st.test(
    st.audioIn(0));



    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.sineseg(
            st.st(8))
,
        st.st(1)

);

p.pan(
      cs.rvf(-1,2));

day => now;
}
spork ~ shred_1();
;


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;