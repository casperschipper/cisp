
cs.sync(0.125000000000);


function void midi_instr_1() { 
    MidiStream midi;
    midi.timer(
    st.beat(
        st.s(120),
        st.seq([2.,2,3,3,3,2,2,1,3,3,3,4,4,4,4])));
    midi.pitch(
    st.hold(
        st.sum(40,
            st.seq([12.,12,0,12,12,12,0,12,12,0,12,0])),
        st.seq([
  st.latch(
      st.s(2),
      st.s(10)),st.s(7)])));
    midi.velo(
    st.line(
        st.seq([0.,100]),
        st.s(11)));
    midi.dura(
    st.beat(120,5));
    midi.start();
    day => now;
}
spork ~ midi_instr_1();

function void midi_instr_2() { 
    MidiStream midi;
    midi.timer(
    st.beat(
        st.s(120),
        st.seq([3.,3,3,3,3,3,3,3,3,3,4,4,4,4])));
    midi.pitch(
    st.sum(52,
        st.seq([0.,7])));
    midi.velo(
    st.line(
        st.seq([0.,100]),
        st.s(17)));
    midi.dura(
    st.beat(120,5));
    midi.start();
    day => now;
}
spork ~ midi_instr_2();

function void midi_instr_3() { 
    MidiStream midi;
    midi.timer(
    st.beat(
        st.s(120),
        st.s(2)));
    midi.pitch(
    st.sum(52,
        st.seq([12.,14])));
    midi.velo(
    st.s(100));
    midi.dura(
    st.beat(120,2));
    midi.start();
    day => now;
}
spork ~ midi_instr_3();

function void midi_instr_4() { 
    MidiStream midi;
    midi.timer(
    st.beat(
        st.s(120),
        st.s(3)));
    midi.pitch(
    st.sum(
        st.s(52),
        st.seq([7.,9])));
    midi.velo(
    st.s(100));
    midi.dura(
    st.beat(120,3));
    midi.start();
    day => now;
}
spork ~ midi_instr_4();

function void midi_instr_5() { 
    MidiStream midi;
    midi.timer(
    st.beat(
        st.s(120),
        st.s(0.333333333333)));
    midi.pitch(
    st.sum(
        st.sum(40,
            st.mup(7,
                st.seq([6.,5,4,3,2,1]))),
        st.hold(
            st.seq([0.,2,-7]),
            st.s(6))));
    midi.velo(
    st.s(100));
    midi.dura(
    st.s(3));
    midi.start();
    day => now;
}
spork ~ midi_instr_5();
fun Stream steppy () {
return 
st.hold(
    st.seq([2.,3,4,5,7,12]),
    st.s(14));
}

function void midi_instr_6() { 
    MidiStream midi;
    midi.timer(
    st.beat(
        st.s(120),
        st.s(4)));
    midi.pitch(
    st.hold(
        st.boundedWalk(
            st.s(40),
            st.s(64),steppy()),
        st.s(1)));
    midi.velo(
    st.line(
        st.seq([0.,120]),
        st.s(33)));
    midi.dura(
    st.s(0.100000000000));
    midi.start();
    day => now;
}
spork ~ midi_instr_6();

<<<"shred id: ",me.id()>>>;
            ShredEvent end;
            "terry1 copy" @=> end.name;
            ShredEventStack stack;
            stack.push(end);
            end => now;
            