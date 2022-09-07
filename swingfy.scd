/*
HelpBrowser.goTo("/usr/local/share/SuperCollider/HelpSource/Tutorials/A-Practical-Guide/PG_Cookbook08_Swing.schelp")
*/
if (p.class==ProxySpace) {p.pop};
(
a = Prout( { |ev|
    var now, nextTime = 0, thisShouldSwing, nextShouldSwing = false, adjust;
    while { ev.notNil } {
        // current time is what was "next" last time
        now = nextTime;
        nextTime = now + ev.delta;
        thisShouldSwing = nextShouldSwing;
        nextShouldSwing = ((nextTime absdif: nextTime.round(ev[\swingBase])) <= (ev[\swingThreshold] ? 0)) and: {
            (nextTime / ev[\swingBase]).round.asInteger.odd
        };
        adjust = ev[\swingBase] * ev[\swingAmount];
        // an odd number here means we're on an off-beat
        if(thisShouldSwing) {
            ev[\timingOffset] = (ev[\timingOffset] ? 0) + adjust;
            // if next note will not swing, this note needs to be shortened
            if(nextShouldSwing.not) {
                ev[\sustain] = ev.use { ~sustain.value } - adjust;
            };
        } {
            // if next note will swing, this note needs to be lengthened
            if(nextShouldSwing) {
                ev[\sustain] = ev.use { ~sustain.value } + adjust;
            };
        };
        ev = ev.yield;
    };
} );
);
q.prinSwing = {"\nSwing Example:\n
Pdef(\\test, Pbind( \\degree, Pn(Pseries(0, 1, 8) ), \\dur, 0.25) );\n
~swing = Pchain( a,\nPdef(\\test),\n(swingBase: 0.25, swingAmount: 1/3)\n)
".postln;'';};
"**** swingfy loaded. check q.printSwing ****".postln;
'';