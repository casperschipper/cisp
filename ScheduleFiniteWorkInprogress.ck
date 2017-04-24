class ScheduleFinite extends Schedule {
    fun void Spark() {
        1 => play;
        while(play) {
            st_procedure.more() => play;
            
            st_procedure.next();
            Math.fabs(st_timer.next()) * second => now;
        }
    }
}

class Foo extends Stream {
    now => time nowy;
    now + 10::second => time then;
    
    

    fun float next() {
        <<<"casper">>>;
    }
    
    fun int more() {
        return (now < then);
    }
}


Foo foo;

ScheduleFinite fin;
fin.init( foo, st.st(1.0));

hour => now;
