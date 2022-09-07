// mono insert FX
SynthDef(\vst_mono, { |out| Out.ar(out, VSTPlugin.ar(\in.ar(0), 1)) }).add;

// stereo insert FX
SynthDef(\vst_st, { |in out| Out.ar(out, VSTPlugin.ar(in, 2)) }).add;

// VST instrument (stereo)
SynthDef(\vsti, { |out| Out.ar(out, VSTPlugin.ar(nil, 2)) }).add;
"**** VST SynthDefs: \vst_mono, \vst_st, \vsti ****".postString;

