

    cs.fillf(1,0,0) @=> float tab1[];



    cs.sine(256,[1.0]) @=> float si[];



    
fun void shred_2() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.index(si,
            st.lowpass(
                st.write(tab1,
                    st.boundedWalk(0,2048,
                        st.boundedWalk(
                            st.mup(-1.0,st.oscin();

),st.oscin();

,
                            st.index(OSC.table9,
                                st.seq(tab1)))),
                    st.count(
                        st.tableCap(tab1))),st.oscin();

,st.oscin();

,st.oscin();

))
,
        st.s(1)

);


p.pan(
      cs.rvf(-1.0,1.0));

day => now;
}
spork ~ shred_2();

    
fun void shred_3() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.index(si,
            st.lowpass(
                st.write(tab1,
                    st.boundedWalk(0,2048,
                        st.boundedWalk(
                            st.mup(-1.0,st.oscin();

),st.oscin();

,
                            st.index(OSC.table9,
                                st.seq(tab1)))),
                    st.count(
                        st.tableCap(tab1))),st.oscin();

,st.oscin();

,st.oscin();

))
,
        st.s(1)

);


p.pan(
      cs.rvf(-1.0,1.0));

day => now;
}
spork ~ shred_3();

    
fun void shred_4() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.index(si,
            st.lowpass(
                st.write(tab1,
                    st.boundedWalk(0,2048,
                        st.boundedWalk(
                            st.mup(-1.0,st.oscin();

),st.oscin();

,
                            st.index(OSC.table9,
                                st.seq(tab1)))),
                    st.count(
                        st.tableCap(tab1))),st.oscin();

,st.oscin();

,st.oscin();

))
,
        st.s(1)

);


p.pan(
      cs.rvf(-1.0,1.0));

day => now;
}
spork ~ shred_4();

    
fun void shred_5() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.index(si,
            st.lowpass(
                st.write(tab1,
                    st.boundedWalk(0,2048,
                        st.boundedWalk(
                            st.mup(-1.0,st.oscin();

),st.oscin();

,
                            st.index(OSC.table9,
                                st.seq(tab1)))),
                    st.count(
                        st.tableCap(tab1))),st.oscin();

,st.oscin();

,st.oscin();

))
,
        st.s(1)

);


p.pan(
      cs.rvf(-1.0,1.0));

day => now;
}
spork ~ shred_5();

    
fun void shred_6() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
        st.index(si,
            st.lowpass(
                st.write(tab1,
                    st.boundedWalk(0,2048,
                        st.boundedWalk(
                            st.mup(-1.0,st.oscin();

),st.oscin();

,
                            st.index(OSC.table9,
                                st.seq(tab1)))),
                    st.count(
                        st.tableCap(tab1))),st.oscin();

,st.oscin();

,st.oscin();

))
,
        st.s(1)

);


p.pan(
      cs.rvf(-1.0,1.0));

day => now;
}
spork ~ shred_6();

<<<"shred id: ",me.id()>>>;ShredEventStack stack;
ShredEvent end;
stack.push(end);
end => now;