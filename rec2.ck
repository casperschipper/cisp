// chuck this with other shreds to record to file
// example> chuck foo.ck bar.ck rec (see also rec2.ck)

// arguments: rec:<filename>

// get name
me.arg(0) => string filename;
if( filename.length() == 0 ) "doedel-veel-midi" => filename;

filename + "-" + Math.random2(0,99999) => filename;

// pull samples from the dac
dac.chan(0) => Gain g1 => WvOut c1 => blackhole;
dac.chan(1) => Gain g2 => WvOut c2 => blackhole;

// this is the output file name
filename + "-1.wav" => c1.wavFilename;
filename + "-2.wav" => c2.wavFilename;

<<<"writing to file:", "'" + c1.filename() + "'">>>;
// any gain you want for the output
1 => g1.gain;
1 => g2.gain;

int s;

// infinite time loop...
// ctrl-c will stop it, or modify to desired duration
while( true ) { 
    1::second => now;  
    <<<"rec2.ck: " + (s++) + " sec">>>; 
}
