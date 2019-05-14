fun Stream a () {
return 
st.t(
    st.seq([
  st.rv(1,44100),st.st(44),st.st(1),st.st(4)]),
    st.walkList([0.100000000000,0.300000000000,0.500000000000,0.700000000000],
        st.hold(
            st.seq([1.,-1]),
            st.seq([30.,43,2,1,30]))));
}
fun Stream b () {
return 
st.line(
    st.ch([1000.,1100]),
    st.rv(100,101));
}
fun Stream c () {
return 
st.line(
    st.ch([4900.,4911]),
    st.rv(100,101));
}

st.bus(
st.t(
    st.seq([127.,2]),
    st.rv(44,45)),"ntwenty");

fun Stream holder () {
return 
st.hold(
    st.seq([  
st.bus("ntwenty"),st.st(3),st.st(12),  
st.bus("ntwenty")]),
    st.seq([st.st(3),st.st(1),
  st.ch([44.,45]),st.st(1)]));
}
fun Stream freq () {
return 
st.linseg(
    st.ftom(
        st.walkList([st.st(3),st.st(30),b(),st.st(100),st.st(20000),c()],
            st.hold(
                st.seq([0.,0,1,2,3]),holder()))),
    st.ftom(
        st.walkList([st.st(5100.0),b(),st.st(30),st.st(10),st.st(80),st.st(10)],
            st.hold(
                st.seq([1.,2,0,3]),holder()))),a());
}


    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.sine(
            st.mtof(freq()))
,
        st.st(1)

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
        st.sine(
            st.mtof(freq()))
,
        st.st(1)

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
        st.sine(
            st.mtof(freq()))
,
        st.st(1)

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
        st.sine(
            st.mtof(freq()))
,
        st.st(1)

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
        st.sine(
            st.mtof(freq()))
,
        st.st(1)

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;