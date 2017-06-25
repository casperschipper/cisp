fun Stream four () {
return 
st.hold(
    st.mup(
        st.series([400.0,200,333.3333,300,250,125,500]),
        st.seq([0.125,0.25,0.5,1.0]),true),
    st.rv(1,3));
}


    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq([-0.1,0.1])
,
        st.t(
            st.seq([four() $ Stream,four(),four()]),
            cs.choosef([0.07,1.4,0.28,0.42]))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

day => now;