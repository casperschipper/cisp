

    cs.alloc(1) @=> float previous[];

fun Stream littlePush () {
return 
st.line(
    st.seq([0.,128]),
    st.rv(5,70));
}
st.audioIn();

fun Stream writer () {
return 
st.write(previous,
    st.indexLin(OSC.table1,
        st.sum(
            st.mup(
                st.sum(
                    st.seq(previous),1),64),littlePush())),
    st.st(1));
}
fun Stream writer2 () {
return 
st.write(OSC.table1,
    st.seq(previous),
    st.t(
        st.seq([
  st.st(0) $ Stream,
  st.count(128)]),
        st.rv(3,5)));
}

st.sampSchedule(
    st.sum(writer(),writer2()),
    st.st(1));



fun void shred_1() {
LineSynth s => Safe safe =>dac;



s.init(
    st.seq(previous)
,
    st.st(10)

);




day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;