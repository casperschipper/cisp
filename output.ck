

    cs.fillf(44100,0,0) @=> float tab1[];


st.sampSchedule(
    st.write(tab1,
        st.audioIn(0),
        st.count(
            st.tableCap(tab1))),
    st.st(1));

fun Stream pan () {
return 
st.t(
    st.rv(-1,1),
    st.fractRandTimer(
        st.ch([0.010000000000,0.010000000000,0.200000000000,0.300000000000,1.0])));
}
fun Stream freq () {
return 
st.t(
    st.ch([st.st(10),st.st(20),st.st(30),st.st(100),
  st.rf(40,50),
  st.rv(1,10000)]),
    st.fractRandTimer(
        st.ch([0.100000000000,0.200000000000,3.0,0.010000000000])));
}
fun Stream feedb () {
return 
st.line(
    st.seq([-0.100000000000,0.100000000000,0.200000000000,0.500000000000,-0.500000000000,0.900000000000]),
    st.ch([0.100000000000,0.200000000000,0.300000000000,1.0]));
}
fun Stream transer () {
return 
st.t(
    st.seq([2.0,0.500000000000]),
    st.ch([0.250000000000,0.500000000000,1.0,2.0,3.0,5.0,10.0]));
}


    
fun void shred_1() {
PulseFBSynth s => Safe safe => dac;

s.init(
        st.indexLin(tab1,
            st.boundedWalk(
                st.st(0),
                st.tableCap(tab1),transer())),
        st.st(1),pan(),freq(),feedb()

);

day => now;
}
spork ~ shred_1();
;


    
fun void shred_1() {
PulseFBSynth s => Safe safe => dac;

s.init(
        st.indexLin(tab1,
            st.boundedWalk(
                st.st(0),
                st.tableCap(tab1),transer())),
        st.st(1),pan(),freq(),feedb()

);

day => now;
}
spork ~ shred_1();
;


    
fun void shred_1() {
PulseFBSynth s => Safe safe => dac;

s.init(
        st.indexLin(tab1,
            st.boundedWalk(
                st.st(0),
                st.tableCap(tab1),transer())),
        st.st(1),pan(),freq(),feedb()

);

day => now;
}
spork ~ shred_1();
;


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;