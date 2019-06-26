fun Stream a () {
return 
st.hold(
    st.seq(
  [9, 18, 7, 5, 14, 8, 22, 4, 9, 7, 13, 5, 21, 8, 4, 14, 13, 21, 9, 14, 18, 13, 17, 21, 8, 18, 13, 21, 14, 8, 18, 12, 17, 14, 13, 21, 18, 13, 8, 17, 14, 21, 18, 12, 4, 8, 17, 21, 18, 14, 21, 17, 21, 14, 17, 18, 12, 14, 21, 8, 12, 18, 4, 14, 17, 21]),
    st.seq(
  [3, 10, 18, 9, 5, 7, 20, 4, 17, 5, 6, 20, 8, 4, 1, 8, 21, 0, 20, 17, 8, 1, 21, 0, 15, 8, 4, 17, 20, 21, 1, 13, 0, 8, 20, 21, 1, 11, 7, 1, 21, 11, 7, 18, 1, 11, 21, 0, 4, 1, 17, 21, 1, 7, 11, 4, 17, 21, 1, 1, 7, 21, 18, 4, 9, 17, 1, 7, 21, 11, 18, 9, 17, 7, 1, 21, 11, 18]));
}
fun Stream stepper () {
return 
st.hold(
    st.seq([-1.,1]),
    st.rv(a(),a()));
}
fun Stream three () {
return 
st.sum(
    st.hold(
        st.walkList(
            [18, 9, 3, 7, 5, 6, 18, 3, 9, 7, 5, 1, 0, 9, 21, 7, 1, 2, 0, 3, 7, 1, 2, 21, 9, 0, 18, 3, 2, 21, 6, 2, 21, 1, 2, 6, 8, 20, 0, 21, 1, 4, 20, 2, 1, 0, 4, 8, 1, 0, 8, 5, 7, 1, 8, 4, 7, 0],stepper()),
        st.walkList(
            [0, 18, 6, 3, 18, 5, 1, 18, 3, 21, 5, 1, 18, 3, 21, 5, 1, 18, 21, 3, 1, 2, 1, 2, 13, 1, 1, 18, 1, 18, 1, 3, 1, 18, 13, 3, 13, 18, 1, 3, 5, 18, 3, 18, 1, 18, 1, 18, 1, 9, 18, 7, 5, 6, 9, 18, 7, 3, 6, 5, 10, 9, 0, 7, 6, 20, 4, 7, 1, 5, 11, 7, 4, 1, 21, 11, 5, 20, 7, 0, 1, 4, 5, 7, 1, 11, 0, 4, 18],stepper())),1);
}


    [0.0, 18, 10, 9, 3, 5, 7, 10, 18, 9, 3, 7, 5, 10, 0, 9, 7, 3, 18, 10, 9, 5, 0, 7, 18, 3, 10, 5, 0, 3, 18, 5] @=> float table[];

fun Stream holder () {
return 
st.seq(
  [1, 1, 1, 1, 4, 1, 1, 4, 1, 4, 1, 1, 4, 1, 4, 5, 6, 4, 7, 5, 1, 4, 5, 1, 5, 7, 4, 1, 5, 4, 6, 5, 1, 4, 7, 5, 6, 4, 5, 7, 4, 6, 1, 5, 7, 4, 6, 4, 5]);
}
fun Stream lsize () {
return 
st.t(
    st.walkList(
        [9, 3, 7, 5, 11, 0, 9, 1, 5, 9, 7, 1, 7, 9, 5, 1, 21, 3, 5, 21, 0, 1, 2, 20, 0, 1, 20, 24, 4, 0, 1, 15, 17, 21, 1, 21, 20, 7, 1, 3, 9, 5, 21, 7, 1, 9, 10, 3, 0, 1, 21, 7],
        st.hold(
            st.seq([-1.,1]),holder())),
    st.rv(0,4));
}
fun Stream transpose () {
return 
st.t(
    st.rv(1,10),
    st.fractRandTimer(
        st.ch([0.100000000000,0.500000000000,1.0,2])));
}

cs.sync(0.140000000000);

fun Stream ctrlStepSize () {
return 
st.div(0.000010000000,
    st.hold(three(),three()));
}


    cs.fillf(441000,0,0) @=> float history[];


st.bus(
st.write(history,
    st.boundedWalk(
        st.st(-1),
        st.st(1),
        st.boundedWalk(
            st.st(-0.100000000000),
            st.st(0.100000000000),
            st.sum(
                st.seq([
  st.mup(-1,ctrlStepSize()) $ Stream,ctrlStepSize()]),
                st.div(three(),100)))),
    st.count(
        st.tableCap(history))),"writeBuff");

fun Stream offset () {
return 
st.line(
    st.seq([0.,44100]),
    st.ch([30.,40,10,1]));
}

st.schedule(    
st.bus("writeBuff"),
    st.st(0.001000000000));



fun void shred_1() {
StepPanSynth s;

s.init(
    st.index(history,
        st.sum(
            st.hold(offset(),4),
            st.count2(
                st.hold(
                    st.ch([16.,32,64,128,32,512]),
                    st.ch([3.,4,5,6])))))
,
    st.st(1)
,
    st.index(history,
        st.sum(
            st.hold(offset(),4),
            st.count2(
                st.hold(
                    st.ch([16.,32,64,128,32,512]),
                    st.ch([3.,4,5,6])))))
);

day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;