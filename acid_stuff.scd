Pdefn(\scale, Scale.choose(7, 12).tuning_(Tuning.choose(12)));Pdefn(\scale).source.name;

Pdef(\acid).set(\attack, 0.04, \acof, 200, \adist, 0.5, \arez, 0.5);
Pdef(\acid).clock_(t).play(quant:4);
Pdef(\acid).gui;
Pdef(\acid).fadeTime_(2);

(
var semelo = ( sem1: Pseq([0,\r,5,\r,-7,-7,\r,-7],inf)-12,
    sem2: Pwrand(
        (-12..0), (11..1).normalizeSum, inf)
);
Pdefn(\degacid,Pnsym1(Pwrand(#[sem1,sem2],[0.7,0.3],inf),semelo));

Pdef(\acid,
    PmonoArtic(
        \acid4,
        \root, -7,
        \scale, Scale.yakahDesc,
        \pan, Pfunc({8.0.rand}),
        \acof, Pbrown(1, 10, 0.2).linexp(1, 10, 60, 4000),
        \rez, Pfunc({ 1.0.rand }),
        // \legato, Pdefn(\legacid) * 1.5,
        \legato, 0.01, //Pdefn(\leg1),
        \adist, 1, // Pfunc({ 0.75.rand }),
        \wform, Pfunc({1.0.rand}),
        // \attack, 2, // Pbrown(0.004, 0.4),
        // \decay, Pbrown(0.04, 0.4),
        \width, Phprand(1.0, 4.0),
        \root, Pstutter(16, Pseq( [-8, -5] , inf) ),
        \degree, Pdefn(\deg8), // * Pbjorklund(3,8,inf), //+ Pseries(0, Pwhite(1, 4) * Prand([-1, 1], inf), inf ).fold(-12, 12),
        \dur, Pwrand([Pdefn(\durb2) * 2, 1/*Pdefn(\durb3)*/], [4, 1].normalizeSum, inf),
        \amp, 0.25,
        \out, Ndef(\orb1).bus //Pseq([Ndef(\orb0).bus, 0, Ndef(\orb1).bus, 0, Ndef(\orb2).bus, 0, Ndef(\orb3).bus, 0], inf)
    )
).play(t, quant:4);
);


(
Tdef(\acid,
    {
        loop{
            16.wait;
        }
    };
).play(t, quant:0);
)

///////////////////////////////////////////////////////////////////////////////////////////

(
Pbindef(\tunel,
    \type, \set,
    \id, Ndef(\tunel).group,
    \t_trig, 1,
    \args, #[freq, t_trig, att, rel, downsamp, amp, legato],
    \freq1, Pwhite(200, 2000, inf),
    \downsamp, 24,
    \modFQ, 32,
    \rel, 2,
    // \att, 2,
    \legato, 0.05,
    \scale, Scale.yakahDesc,
    \degree, Pdefn(\deg7) - 12,// * Pseq([\r, 1],inf),
    \dur, Pseq([Pn(Pdefn(\duracid) * 0.5, 4), Pn(Pdefn(\durb5) * 0.5, 4)], inf) * 4,
    //Pdefn(\duracid) * 0.5,// Pseq([0.25, 0.125, 0.125, 0.25, 0.125, 0.125, 0.125, 0.25, 0.125, 0.25, 0.125], inf) * Pwrand([0.5, 1], [1, 4].normalizeSum, inf),
    \amp, 0.5,
).play(t).quant_([4, 0.5]);
)

Ndef(\orb0).put(0, Ndef(\tunel)) //, { Ndef(\tunel).ar } ) // <<> nil //Ndef(\tunel)

Ndef(\orb0).clock_(t).quant_([4, 0, 0.5]);

Ndef(\tunel).gui;

Ndef(\tunel).addSpec(\downsamp, [1, 32]);
Ndef(\tunel).addSpec(\modFQ, [1, 32]);
Ndef(\tunel).addSpec(\wform, [0, 1]);
Ndef(\tunel).addSpec(\att, [0.02, 0.2]);
Ndef(\tunel).addSpec(\rel, [0.2, 2, \lin]);
Ndef(\tunel).addSpec(\t_trig, [0, 1]);
