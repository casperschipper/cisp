


function void midi_chuck_channel_streams_1() {
    MidiNoteChannelStream s;
    s.timer(
    st.st(1.0));
    s.pitch(
    st.index([60,64,67,72],        
st.bus("i")));
    s.dura(
    st.st(0.100000000000));
    s.velo(
    st.st(100));
    s.channel(
    st.st(1));
    
    s.start();

}
spork ~ midi_chuck_channel_streams_1 ();


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;