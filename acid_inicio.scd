Pdefn(\scale, Scale.choose(7, 12).tuning_(Tuning.choose(12)));Pdefn(\scale).source.name;

Spec.add(\attack, [0.04,1]);
Spec.add(\acof, [50, 5000, \exp]);
Spec.add(\adist, [0.0,1]);
Spec.add(\arez, [0,0.7]);
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
        \legato, Pwhite(0.25, 1.2),
    \scale, Scale.yakahDesc,
        \degree, Pswitch([Pn(Pdefn(\deg2) - 12, 4), Pn(Pdefn(\deg1) -12), 4], inf),
        \acof, Pwhite(50, 5000),
        \adist, Pbrown(),
        \arez, Pbrown(0, 0.7),
        \dur, Pdefn(\durb2) * 0.5,
        \attack, Pbrown(0.01, 1),
        \rel, Pwhite(),
        \amp, 0.2
    )
).play(t, quant:4);
);

PdefAllGui(8)


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
    \degree, Pdefn(\deg6) - 12,// * Pseq([\r, 1],inf),
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
