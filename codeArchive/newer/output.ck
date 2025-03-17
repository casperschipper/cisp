

    cs.fillf(16,-1,1) @=> float amp[];



    cs.fillf(256,-1,1) @=> float pantab[];

fun Stream a () {
return 
st.line(
    st.seq([1.,1000]),
    st.ch([1.,2,3]));
}


    
fun void shred_2() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_2();

    
fun void shred_3() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_3();

    
fun void shred_4() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_4();

    
fun void shred_5() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_5();

    
fun void shred_6() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_6();

    
fun void shred_7() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_7();

    
fun void shred_8() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_8();

    
fun void shred_9() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_9();

    
fun void shred_10() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_10();

    
fun void shred_11() {
StepPanSynth s;

s.init(
        st.walkList(amp,
            st.boundedWalk(
                st.s(1),a(),
                st.ch([-1.,1])))
,
        st.t(
            st.ch([1.,2,4,8,16,32,64,128,256,512,1024]),
            st.ch([0.010000000000,0.100000000000,0.200000000000,0.500000000000,1.500000000000,3.0]))
,
        st.hold(
            st.seq(pantab),
            st.ch([
  st.s(100000) $ Stream,
  st.weights([[1,100000],[1000,100]])]))
);

day => now;
}
spork ~ shred_11();

<<<"shred id: ",me.id()>>>;
            ShredEvent end;
            "genesis" @=> end.name;
            ShredEventStack stack;
            stack.push(end);
            end => now;
            