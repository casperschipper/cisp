fun Stream updateS () {
return 
st.t(
    st.rv(1,128),
    st.fractRandTimer(
        st.ch([0.001000000000,0.100000000000,0.200000000000,0.500000000000,1.0])));
}

st.sampSchedule(
    st.write(OSC.table3,
        st.sometimes(
            st.rv(-1,1),
            st.st(0),updateS()),
        st.count(updateS())),
    st.seq([updateS() $ Stream,updateS(),updateS()]));



    
fun void shred_1() {
StepPanSynth s;

s.init(
        st.seq(OSC.table3)
,
        st.seq([
  st.div(updateS(),updateS()) $ Stream,
  st.div(updateS(),updateS()),
  st.div(updateS(),updateS())])
,
        st.seq(OSC.table3)
);

day => now;
}
spork ~ shred_1();
;


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;