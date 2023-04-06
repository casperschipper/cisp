
[200.0,3,4,10,11,74,16,16,1012] @=> float tab1[];

fun Stream top () {
return 
st.line(
    st.seq([st.st(0),
  st.tableCap(tab1)]),
    st.ch([3.,5,6]));
}
fun Stream indexer () {
return 
st.rv(top(),top());
}
fun Stream holder () {
return 
st.index(tab1,indexer());
}
