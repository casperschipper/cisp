fun Stream mupper () {
return 
st.t(
        st.rv(1,40),
        st.ch([0.1,0.2,0.4,0.8,1.6,3.2,6.4]));
}
fun Stream silent () {
return 
st.t(
        st.seq([
    st.t(
            st.seq([0,1]),
            st.st(0.1)),st.st(0.1),st.st(0.2)]),
        st.ch([1,2,4]));
}
fun Stream ampy () {
return 
st.t(
        st.seq([silent(),st.st(1)]),
        st.ch([0.06,0.06001]));
}
fun Stream detuned () {
return 
st.line(
        st.seq([st.st(100),
    st.rv(0,100)]),
        st.rv(30,90));
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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
                                st.index([st.mup(detuned(),2) $ Stream,st.mup(detuned(),1),st.mup(detuned(),3),st.mup(detuned(),4),st.mup(detuned(),5),st.mup(detuned(),6),st.mup(detuned(),7),st.mup(detuned(),8),st.mup(detuned(),9)],
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