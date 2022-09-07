
Pdefn(\degdrums,Prand([Pwalk([8-5,-3,2,4,7],Prand([-1,-2,0,1,2],inf),Pseq([-1,1],inf)),Pwalk((-12..12),Prand([-2,-1,0,1,2],inf),Prand([-1,1],inf))],inf)+Pstutter(32,Pseq([6,12,-4,0],inf),inf,1) - 12)

(
Pdefn(\degdrums, Pexprand(1,8.0,inf).round(0.1) + 5);
Pdef(\drumc,
    Pbind(
        \type, \vst_midi,
        \vst, ~drumc,
    )
).play(t, quant: 4)
)

Pbindef(\drumc).stop;

Pdef.all.clear

~k = -9.1; ~sn = -15; ~cp = ( -21.1, -20.9 .. 0 )

(
Pbindef( \test,
    \type, \vst_midi,
    \vst, ~drumc,
    \degree, -19.9,
    \dur, 1
).play(t, quant:1)
)

(
Pbindef( \drumca,
    \type, \vst_midi,
    \vst, ~drumc,
    \amp, Pbrown(1, 0.8),// * Pbjorklund(3, 8, inf),
    \degree, [~k],
    // \dur, Pbjorklund( 3, 8, inf) * ,
    \dur, Pdefn(\durb2), // * 0.5, // Pbjorklund2( 3, 8, inf) * 0.25,//1 //Prand([0.75, 0.78, 0.88, 0.27, 0.09, 0.25, 0.8, 0.96], inf),
    // \freq, Pxrand([364.88, 174.99, 471.09, 524.88, 493.34, 258.37, 167.61, 97.62], inf),
    /*\degree, Pswitch([
    Pseq([13, 11, 9], 4), Pseq([0, 0, 0, 4, 0], 4),Pn(Pdefn(\degg) - 5, 4) ],
    Prand([0,1,2],inf),
    inf) - 20,Pbjorklund(7,9,inf) * -1*/
).play(t, quant:4);
)

~drumc.synth.set(\out, 4)

Ndef(\orb0).put(0, ~drumc)

(
var indices = [7, 3, 1, 2, 0, 2, 5];
var data = [0, 2, 2, -10, 4, -6, 7];
Pbindef( \kickit,
    \type, \vst_midi,
    \vst, ~drumc,
    \amp, 0.35, //Pbjorklund(17, 32) * (Pbrown(0.125, 0.35)),
    \choice, Prand(indices,inf),
    \degree, /*~sn + 0.1,// */Pdefn(\degg,Pindex(data, Pkey(\choice),inf)) + [-15, -12] + Pdefn(\deg4),
    \dur, Pseq([Pn(Pdefn(\durb1) * 0.5, 4), Pn(Pdefn(\durb2) * 0.5, 4)], inf),
).play(t, quant: [4, 0.25])
)

Ndef(\orb2).put(0,Ndef(\drumcomp))

Ndef(\drumcomp).gui

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
    \args, #[freq, t_trig, dur, legato, sustain],
    \scale, Pdefn(\scale),
    \legato, 8, // Prand([0.1, 0.5, 1.2, 1.8], inf),
    \degree, Pseq([0, 0, \r, -7, \r, \r, -7, \r], inf),
    // \degree, 3,
    \t_trig, Pseq([1, 1, 0, 1, 0, 0, 1, 0], inf),
    \amp, 0.3,
    \dur, /*Pbjorklund2(5, 8) **/ 0.5, // Pseq([0.25, 0.125, 0.125, 0.25, 0.125, 0.125, 0.125, 0.25, 0.125, 0.25, 0.125], inf) * Pwrand([0.5, 1], [1, 4], inf) * 2,
).play(t, quant: 4);
)

// FRASES


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
