// chuck this with other shreds to record to file
// example> chuck foo.ck bar.ck rec (see also rec2.ck)

// arguments: rec:<filename>

// get name
me.arg(0) => string filename;
if( filename.length() == 0 ) "gendyBirds2" => filename;

// pull samples from the dac
dac.chan(0) => Gain g1 => WvOut c1 => blackhole;
dac.chan(1) => Gain g2 => WvOut c2 => blackhole;
dac.chan(2) => Gain g3 => WvOut c3 => blackhole;
dac.chan(3) => Gain g4 => WvOut c4 => blackhole;

// this is the output file name
filename + "-1.wav" => c1.wavFilename;
filename + "-2.wav" => c2.wavFilename;
filename + "-3.wav" => c3.wavFilename;
filename + "-4.wav" => c4.wavFilename;

<<<"writing to file:", "'" + c1.filename() + "'">>>;
// any gain you want for the output
1 => g1.gain;
1 => g2.gain;
1 => g3.gain;
1 => g4.gain;

// infinite time loop...
// ctrl-c will stop it, or modify to desired duration
60::second => now;
<<<"ok done">>>;
ms => now;
