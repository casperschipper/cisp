class M extends st {
    seq(
    latch( st(999), st(1)),
    seq([11,12,13],true)
    ).test();
}
M m;
hour => now;