fun Stream casper () {
return 
st.sum(64,
    st.seq([
        st.seq([0,-2,-7,-12,-24]),
        st.index([0,12,24,-12,7],
            st.boundedWalk(0,4,
                st.hold(
                    st.ch([-1,1]),
                    st.rv(7,13)))),
        st.seq([7,-7,12,0,36,-7,-12]),st.st(12)]));
}
fun Stream velo () {
return 
st.line(
    st.seq([30,100]),
    st.ch([7,11]));
}

function void midi_instr_1() { 
    MidiStream midi;
    midi.timer(0.1);
    midi.pitch(
    st.loop(casper(),
        st.seq([3,2,5,3]),
        st.seq([3,1,3])));
    midi.velo(velo());
    midi.dura(0.1);
    midi.start();
    day => now;
}
spork ~ midi_instr_1();

function void midi_instr_2() { 
    MidiStream midi;
    midi.timer(0.1);
    midi.pitch(
    st.loop(casper(),
        st.seq([3,2,5,3]),
        st.seq([
            st.rv(2,3),st.st(1),st.st(3)])));
    midi.velo(velo());
    midi.dura(0.1);
    midi.start();
    day => now;
}
spork ~ midi_instr_2();

function void midi_instr_3() { 
    MidiStream midi;
    midi.timer(0.1);
    midi.pitch(
    st.loop(casper(),
        st.seq([3,2,5,3]),
        st.seq([
            st.rv(2,3),st.st(1),st.st(3)])));
    midi.velo(velo());
    midi.dura(0.1);
    midi.start();
    day => now;
}
spork ~ midi_instr_3();

day => now;