

    cs.fillf(4096,-1,1) @=> float tab1[];

fun Stream stepy () {
return 
st.loop(
    st.count(
        st.tableCap(tab1)),
    st.ch(4),
    st.ch([2.,1,5]));
}
fun Stream indexer () {
return 
st.boundedWalk(
    st.st(0),
    st.tableCap(tab1),stepy());
}
fun Stream tabwrite () {
return 
st.write(tab1,
    st.audioIn(0),
    st.count(
        st.tableCap(tab1)));
}

st.schedule(tabwrite(),
    st.seq([
  st.tLatch(
      st.st(0.001000000000),
      st.st(0.500000000000)) $ Stream,
  st.tLatch(
      st.rv(1,4),
      st.rv(1,4))]));



fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.index(tab1,indexer())
,
    st.st(1)

);



day => now;
}
spork ~ shred_1();


fun void shred_2() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
    st.seq(tab1)
,
    st.st(1)

);

p.pan(0.900000000000);

day => now;
}
spork ~ shred_2();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;