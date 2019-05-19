fun Stream walki () {
return 
st.guardedWalk(0,[st.guardTest(    st.smaller(128),    st.st(50))$ Guard,st.guardTest(    st.bigger(0),    st.st(50)),st.otherwise(    st.hold(        st.ch([1.,1]),        st.st(10)))]);
}

st.test(walki());


<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;