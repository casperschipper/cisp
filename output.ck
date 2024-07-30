fun Stream a () {
return 
st.line(
    st.seq([0.010000000000,1.0]),
    st.s(10));
}
fun Stream b () {
return 
st.line(
    st.seq([0.010000000000,1.0]),
    st.s(7));
}



function void midi_chuck_channel_streams_1() {
    MidiNoteChannelStream s;
    
    s.timer(
    st.ch([0.100000000000,0.101100000000]));
    s.pitch(
    st.sum(
        st.seq([70.,77,82]),
        st.hold(
            st.walk(0,
                st.ch([-2.,2])),
            st.rv(4,11))));
    s.dura(
    st.s(1.0));
    s.velo(
    st.s(100));
    s.channel(
    st.s(1));
    s.start();

    365*day => now;

}
spork ~ midi_chuck_channel_streams_1 ();


<<<"shred id: ",me.id()>>>;
            ShredEvent end;
            "sunday" @=> end.name;
            ShredEventStack stack;
            stack.push(end);
            end => now;
            