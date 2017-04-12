fun Stream verySlowOctaver () {
return 
st.line(
        st.ch([0.01,0.125,0.25,0.5,1.0]),
        st.ch([16,32,64]));
}
fun Stream alpha () {
return 
st.line(
        st.seq([1,80]),
        st.mup(
                st.fractRandTimer(0.0001),verySlowOctaver()));
}
fun Stream slowFielder () {
return 
st.line(
        st.rv(1,128),
        st.rv(1,40));
}


        st.collect(
                st.walk(0,
                        st.ch([-0.1,0.1])),128) @=> float table[];

        
fun void shred_1() {
StepSynth s => Safe safe => dac;

s.init(
                st.seq([-1,1])
,
                st.hold(
                        st.walkList([st.st(1),st.st(2),st.st(3),st.st(4),st.st(5),st.st(6),st.st(7),st.st(8),alpha()],
                                st.ch([-1,1])),
                        st.walkList([1,2,3,4,5,6,7,8],
                                st.ch([-1,1])))

);



day => now;
}
spork ~ shred_1();
;

        
fun void shred_1() {
StepSynth s => Safe safe => dac;

s.init(
                st.seq([-1,1])
,
                st.hold(
                        st.walkList([st.st(1),st.st(2),st.st(3),st.st(4),st.st(5),st.st(6),st.st(7),st.st(8),alpha()],
                                st.ch([-1,1])),
                        st.walkList([1,2,3,4,5,6,7,8],
                                st.ch([-1,1])))

);



day => now;
}
spork ~ shred_1();
;

        
fun void shred_1() {
StepSynth s => Safe safe => dac;

s.init(
                st.seq([-1,1])
,
                st.hold(
                        st.walkList([st.st(1),st.st(2),st.st(3),st.st(4),st.st(5),st.st(6),st.st(7),st.st(8),alpha()],
                                st.ch([-1,1])),
                        st.walkList([1,2,3,4,5,6,7,8],
                                st.ch([-1,1])))

);



day => now;
}
spork ~ shred_1();
;

day => now;