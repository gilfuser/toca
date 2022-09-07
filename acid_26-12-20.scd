Pdefn(\scale, Scale.choose(7, 12).tuning_(Tuning.choose(12)));Pdefn(\scale).source.name;

Pdef(\acid).set(\attack, 0.04, \acof, 200, \adist, 0.5 );
Pdef(\acid).clock_(t).play(quant:4);
Pdef(\acid).gui;
Pdef(\acid).fadeTime_(2);

(
var semelo = (
    sem1: Pseq([0,5,-7,-7,-7],inf),
    sem2: Pwrand(
        (-12..0), (11..1).normalizeSum, inf)
);
~degacid = Pnsym1(Pwrand(#[sem1,sem2],[0.7,0.3],1),semelo);

Spec.add(\attack, [0.04,1]);
Spec.add(\acof, [50, 5000, \exp]);
Spec.add(\adist, [0,1]);

Pdef(\acid,
    PmonoArtic(
        \acid4,
        \adist, 1,
        \legato, ~leg2,
        \root, -7,
        \scale, Scale.melodicMinor,
        \note, Pwrand([-12, ~degacid, \], [4, 2, 1].normalizeSum, inf),
        \dur, 0.25,
        \amp, 0.2
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
    \scale, Scale.melodicMinor,
    \degree, 0,
    // \degree, Pdefn(\deg7) - 12,// * Pseq([\r, 1],inf),
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
