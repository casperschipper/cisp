
st.sampSchedule(
    st.write(OSC.table1,
        st.boundedWalk(40,120,
            st.hold(
                st.seq([0.,0,0,12,-12]),
                st.seq([1.,2]))),
        st.count(0)),
    st.line(
        st.seq([4410.,4410]),
        st.ch([1.,3,7])));


st.bus(
st.st(1),"tableMax");


st.bus(
st.seq([
  st.latch(
      st.seq([1.,2,0]),
      st.rv(1,2)) $ Stream,
  st.ch([3.,0,0,0])]),"deltaBus");


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;