fun Stream mupper () {
return 
st.t(
    st.rv(1,40),
    st.ch([0.1,0.2,0.4,0.8,1.6,3.2,6.4]));
}
fun Stream silent () {
return 
st.t(
    st.seq([0.001,0.1,0.2]),
    st.ch([1,2,4]));
}
fun Stream ampy () {
return 
st.t(
    st.seq([silent(),st.st(1)]),
    st.ch([0.1,0.100001]));
}


    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq([
            st.mup(ampy(),0.5) $ Stream,
            st.mup(ampy(),-0.5)])
,
        st.div(44100,
            st.t(
                st.index(
                    st.collect(
                        st.walk(100,
                            st.rv(99.95,100.1)),10),
                    st.loop(
                        st.rv(0,10),
                        st.seq([st.st(2),
                            st.ch([2,3,4])]),
                        st.ch([2,3,6]))),
                st.mup(
                    st.seq([0.1,0.2]),mupper())))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

day => now;