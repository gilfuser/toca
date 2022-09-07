~k = [-9.1,-9,-8.9]; ~sn = [-16,-15.1,-15]; ~cp = [-20.1,-20.9,-20,-20.1,-19.9,-19,-18,-17.9,-17,-16.9]; ~per = [-14,-13.9,-13,-12.9,-12,-11,-10.9,-10,-9.9]; ~rnd = [-8,-7,6.9,-6,-5.9,-5,-4,-3.9]; ~ch = [-3,-2.9,-2,0,0.1,1,1.1,2]; ~prr = (3..12); ~hh = [13,14,14.1,15,15.1,16,17,17.1,18,18.1,19,19.1,20]; ~rnd2 = (21..39);

(
// Pdef(\drumc).clear;
Pdef(\drumc,
    Pbind(
        \instrument, \Mridangam,
        \degree, -20,
        \amp, 0.5,
        \dur, ~durb1,
    )
).play(t, quant: 4)
)

Ndef(\orb2).put(0, Ndef(\drumcomp) )

Pbindef(\drumc).stop;


(
Pbindef( \drumca,
    \type, Pseq([\, \note], inf),
    \instrument, \ana_snare,
    \dur, 0.5
).play(t, quant:4);
)
Scale.directory
(
var indices = [7, 3, 1, 2, 0, 2, 5];
var data = [0, 2, 2, -10, 4, -6, 7];
Pbindef( \kickit,
    \instrument, Pstutter(4, Pseq([\ana_hat, ( \gong_ ++ q.gongSpecs.size.rand ).asSymbol, 'up-snare-1', \SOStom], inf)),
    \scale, Scale.melodicMinor,
    \degree, ~deg2, //Pclump([ ~deg0, ~deg1, ~deg2, ~deg3], inf),
    \dur, ~durb2 * 0.5,
).play(t, quant: 4)
)

Ndef(\orb2).put(0,Ndef(\drumcomp))

Pdef(\kickit).gui

(
Pbindef(\set_vital,
    \type, \vst_set,
    \vst, ~drumc,
    \params, [\Volume, /*'Oscillator 1 Distortion Amount' 377*/],
    \Volume, 0.25,
    // 'Oscillator 1 Distortion Amount', Penv([0,1,0], [1,1]*0.25, \lin),
    \dur, Pbjorklund2(5, 8, inf) * 0.25
).play(quant: 1)
)

////////////////////////////////// DUBBA /////////////////////////////////

(
Pbindef(\dubba,
    \type, \set,
    \id, Ndef(\dubba).group,
    \args, #[freq, t_trig, dur, legato, sustain, att],
    \scale, Pdefn(\scale),
    \legato, 16, // Prand([0.1, 0.5, 1.2, 1.8], inf),
    \scale, Scale.yakahDesc,
    \degree, Pdefn(\deg8),
    \att, 0,
    // \degree, 3,
    \t_trig, 1, //Pseq([0.5,1], inf),
    \amp, 0.3,
    \dur, Pswitch( [Pn(Pdefn(\durb3),4), Pn(Pdefn(\durb4),4) ],inf ) //4,/*Pbjorklund2(5, 8) **/ 0.5, // Pseq([0.25, 0.125, 0.125, 0.25, 0.125, 0.125, 0.125, 0.25, 0.125, 0.25, 0.125], inf) * Pwrand([0.5, 1], [1, 4], inf) * 2,
).play(t, quant: 4, timingOffset: -0.5);
)

t.tempo = 110/60/2;

Pdef(\dubba).gui;

Ndef(\dubba).addSpec(\att, [0.005, 0.5]);
Ndef(\dubba).addSpec(\rel, [0.05, 0.5]);

Ndef(\dubba).clock = t;

Ndef(\dubba).play;

// FRASES

(
~phrases = (
    repeated: Pbind(
        \instrument, \bass,
        \midinote, 36,
        \dur, Pseq([0.75, 0.25, 0.25, 0.25, 0.5], 1),
        \legato, Pseq([0.9, 0.3, 0.3, 0.3, 0.3], 1),
        \amp, 0.5, \detune, 1.005
    ),
    octave: Pmono(\bass,
        \midinote, Pseq([36, 48, 36], 1),
        \dur, Pseq([0.25, 0.25, 0.5], 1),
        \amp, 0.5, \detune, 1.005
    ),
    tritone: Pmono(\bass,
        \midinote, Pseq([36, 42, 41, 33], 1),
        \dur, Pseq([0.25, 0.25, 0.25, 0.75], 1),
        \amp, 0.5, \detune, 1.005
    ),
    dim: Pmono(\bass,
        \midinote, Pseq([36, 39, 36, 42], 1),
        \dur, Pseq([0.25, 0.5, 0.25, 0.5], 1),
        \amp, 0.5, \detune, 1.005
    )
);

TempoClock.default.tempo = 128/60;

// the higher level control pattern is really simple now
p = Psym(Pxrand(#[repeated, octave, tritone, dim], inf), ~phrases).play;
)

///////////////////////////////////////////////////////////////////////

(
s.waitForBoot {
    // ~clock = TempoClock.default;
    ~vstName ="DrumComputer";
    ~openGui = true;
    // VSTPlugin.search(action: {
    //  SynthDef(\vstInst, { arg out = 0;
    //   var sig = VSTPlugin.ar(nil, 2);
    //   Out.ar(out, sig);
    //  }).add;
    // });
    s.sync;
    // ~vstProxy = NodeProxy(s, \audio, 2).clock_(~clock).play;
    s.sync;

    Ndef(\setup).clock_(t).play;
    Ndef(\setup).source = \vsti; // I modified the Glen's code to include a Ndef setup for the effect
    s.sync;

    t.play({
        var bundle = s.makeBundle(false, {
            ~drumc = VSTPluginController(Synth.basicNew(\vsti, s, Ndef(\setup).objects.first.nodeID));
            ~drumc.open(~vstName, editor: true, action: {
                "Opened VSTPluginController with %".format(~vstName).postln;
                if (~openGui) {
                    ~drumc.editor
                }
            });
        });
        s.listSendBundle(s.latency, bundle)
    });
}
)

(
p = Pbindef(\synth,
    \type, \vst_midi,
    \vst, ~drumc, // the VSTPluginController instance
    \midicmd, \noteOn, // the default, can be omitted
    \chan, 0, // MIDI channel (default: 0)
    \midinote, Pwhite(0,70),
    \dur, 0.2,
    \amp, 0.8,
    \stretch,  60/120*4,
).clock_(t);
)

Ndef(\setup).clock_(t)//.play

Ndef(\setup).stop

Ndef(\orb0).put(0, Ndef(\setup))

Ndef(\mod, {
    LFNoise1.kr(0.1).range(0.125, 1)
})



Ndef(\orb0) <<> .trate nil//Ndef(\mod)

Ndef(\setup, {

})

u=p.play

u.stop


Ndef(\sickfx).source = Ndef(\setup);
(
Ndef(\sickfx)[1] = \filter -> {|in|
    PitchShift.ar(in, 0.14, 2)};
)

(
Ndef(\sickfx).play;
u=p.play; // without starting the pattern nothing happens
)

(
u.stop;
Ndef(\sickfx).stop;

)
