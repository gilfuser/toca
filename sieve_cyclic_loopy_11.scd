
// 	cyclic loopy thing a'la Yannis X;
// based on SC-users code by danijoss@blueyonder.co.uk
//	hh 2005-2015
// ver 10: 09Juy added all into Tdef.envir!!
// 08April added flam
// Todo..
/* add slider params to all synthdefs:

length		// via Task !!!
detuen		// in basses yes
Dev
offset -- preset...
cioe 2 general and 2 obvius parameters
*/
(
s.boot; s.scope(2);
p = ProxySpace(s).push;
q=q?();
);

// second: all the rest
(
// sound init
~mX = {MouseX.kr};
~mY = {MouseY.kr};

q.cSynths = (
	\softBass : {
		{ |freq=300, index=0,  amp=1, dur=0.03| Line.ar(0.25, 0, dur,
			PMOsc.ar(freq * Rand(1, 1.02),LFNoise1.kr(10!2, 300,500), index, 0,amp),
			0.1, 2) };
	},
	\blubber : {
		{ |freq=300, index=0,  amp=1, dur=0.03|
			freq = freq* ~mX.kr.madd(10, 0.1);
			Line.ar(0.25, 0, dur,
				Formant.ar(
					freq * Rand(1, 1.2),
					LFNoise1.kr(10!2, 300,500), index*500+10,amp),
				0.1, 2
			)
		};
	},
	\bassy_herby : {
		{ |freq=300, index=0, amp=1, dur=0.03|
			RLPF.ar(
				Line.ar( 0.25, 0, dur,
					Saw.ar(
						freq * Rand(1, 1.02)+LFNoise1.kr(10!2, 300,500),
						amp
					),
					0.1, 2
				).lag(0.02),
				(
					SinOsc.kr(
						index* ~mX.kr.linexp(0,1, 0.01, 5000),
						Rand(0!2, pi),
						300,
						300
					) + freq * 0.125
				).lag(0.003).min(10000),
				0.028, 3
			).softclip
		};
	},
	\some_glissing : {
		{ |freq=300, index=0,  amp=1, dur=0.03|
			freq = freq * ~mX.kr.linexp(0, 1, 0.01, 9);
			Line.ar(0.25, 0, dur,
				Blip.ar(
					(freq * Rand(1, 1.2)+LFNoise1.kr(index+0.1!2, 300,500)).wrap(10, 18000),
					index * 5 + 1,
					amp
				),
				0, 2) };
	},
	\some_glissing2 : {
		{ |freq=300, index=0,  amp=1, dur=0.03|
			freq = (freq * ~mX.kr.madd(7.75, 0.25) * Rand(1, 1.2)-1000);
			Line.ar(0.25, 0, dur,
				Blip.ar(
					(freq + LFNoise1.kr(index+0.1!2, 300,500)).wrap(10, 18000),
					( index.squared * 15).abs +1,
					amp
				),
				0, 2) };
	},
	\some_glissing3 : {
		{ |freq=300, index=0,  amp=1, dur=0.03|
			freq = (freq * ~mX.kr.madd(7.75, 0.25) * Rand(1, 1.2)-1000);
			XLine.ar(0.25, 0.001, dur,
				Blip.ar(
					(freq + LFNoise1.kr(index+0.1!2, 300,500)).cpsmidi.wrap(4,133).midicps,
					( index.squared * 15).abs +1,
					amp
				),
				0, 2) };
	},
	\blip_Fun : {
		{ |freq=300, index=0,  amp=1, dur=0.03|
			freq = freq * ~mX.kr.linexp(0, 1, 0.01, 10);
			Line.ar(0.25, 0, dur,
				Blip.ar(freq * Rand(1, 1.02), LFNoise1.kr(index*10!2, 30,31)+1, amp),
				0.1, 2).softclip };
	}
)

// Proxy to play the sounds in
~cyclyGrn.ar(q.numChans ? 2);
~cyclyGrn.play;
~cyclyGrn.fadeTime = 5;
// ~cyclyGrn.spawn;		// test tone
);



(
	// FX for the Proxy
	~cyclyGrn[5]  =  \filter -> { |in, gain=0.5, xOverF=400, bal=0, wet=0.06|
		var divide, summ, ratios = 10, rev;
		bal = LinExp.kr(bal, -1, 1, ratios.reciprocal, ratios);
		in = in * gain;
		divide = LPF.ar(in, xOverF);
		divide = [divide * bal.reciprocal, in-divide * bal];
		summ = divide.sum;
		rev = HPF.ar(summ, 250);
		4.do({  rev = AllpassL.ar(
			rev, 0.1, Rand(0.01,0.1) * LFNoise1.kr(1/10,0.49,0.5), Rand(0.2,1.4), wet, rev
		)});
		Limiter.ar( summ + rev );
	};

	~cyclyGrn[10]  =  \filter -> {|in, drive=0.5|
		in.madd(drive).distort
	};
	~cyclyGrn[15]  =  \filter -> {|in|
		Limiter.ar(HPF.ar( LeakDC.ar(in), 30) )
	};
~cyclyGrn.edit;
Spec.add( \wet, \unipolar);
Spec.add( \bal, \pan);
Spec.add( \drive, [0.01, 20, 4]);
Spec.add( \xOverF, \freq);
Spec.add( \wet5, \unipolar);
Spec.add( \wet10, \unipolar);
Spec.add( \wet15, \unipolar);
);


(
Tdef(\loopYdani).set(\dt, 15 / 123 );	// 	dt as BPM
Tdef(\loopYdani).set(\normLength, 0);	// general length scale for all sYnths
Tdef(\loopYdani).set(\x, 0, \y, 0);
Tdef(\loopYdani).set(\beatNum, 7);
Tdef(\loopYdani).set(\slDetun, 0);		// general detune for all sYnths : midiratio in ratio
Tdef(\loopYdani).set(\slDev, 0);		// general deviation factor for all sYnths : [0..1]
Tdef(\loopYdani).set(\cyOffsetsList, ["0", "0.01", "0.5"]);

Tdef(\loopYdani).quant_(1);
Tdef(\loopYdani, { arg e; var a, b=0, c=0, d=0, n=0, flam=false, fCount=0, dtf=1;
	// ~cyclyGrn.play.resume;  // play the Synth
	inf.do({ |i|
		// comment in/out parts as you like
		if (n % 3 == (e.y*4).trunc, {
		~cyclyGrn.spawn([\freq, 800 * [1, 1.2].choose, \amp, 0.73])
		});
		/*
		if (i % 36 == 0, {
		~cyclyGrn.spawn([\freq, 50 * e.slDetun + (e.slDev.rand2 * 5), \amp, 0.82, \index, 0.2, \dur, 1.6 * e.normLength])
		});
		if (n % 4 == 0, {
		~cyclyGrn.spawn([\freq, n*70+60 * e.slDetun, \amp, 0.5, \index, n/7])
		});//quatsch
		*/
		if (n * (e.y*8)  % e.beatNum % b == (e.x*4).round(1), {
			~cyclyGrn.spawn([\freq, n*14+2200 * e.slDetun, \index, i + e.slDev * 40, \dur, 0.01 * e.normLength, \amp, 0.5]);
			b = [0, 0, 0, 0.1, 0.3, 0.05, 0, 0, 0.55].windex + (e.y % 0.25);
		});
		if (n % c == (e.x*6).round(1), {
			~cyclyGrn.spawn([\freq, 90 + (e.slDev.rand*10) * e.slDetun, \index, c * 0.03, \dur, 0.2 * e.normLength]);
			c = [0, 0.05, 0.3, 0.1, 0.3, 0.05, 0, 0, 0.2].windex;
		});
		if (n % ((e.y*8).round(1)+1) == d, {
			~cyclyGrn.spawn([\freq, 900 * e.slDetun, \index, e.slDev ** n.neg + d * 3, \amp, 0.5 ]);
			d = [0.3, 0.1, 0.4, 0.2].windex;
		});
		// extra flam
		// if(i % 4==3 and: {(e.y*6pi%1/5).coin}) { flam=true };
		// if( flam == true ){   flam=false; q.flamrout.stop.reset.play  };

		n = i % e.beatNum;

		// for visualizer. ToDo change var f to something less global!
		try{ defer{f.value([n, b, c, d]) }};

		e.dt.wait;
	})
});
);
/////////////////////////////////////////////////////////////////////
////////////////// internal state visualisation  ////////////////////
/////////////////////////////////////////////////////////////////////
(
b = 0.dup(40).dup(3).plot;
// ToDo: check Specs
// ToDo: make func somewhat local
b.domainSpecs = [[0, 32], [0,12], [0, 8], [0, 4]];
b.plotMode = \steps;
(
f = {|args|
	b.value = b.value.flop.rotate(-1).put(0, args).flop;
	b.refresh;
};
);
);
/*
b.domainSpecs = [[0, 115, \lin, 1]]; b.refresh;
b.value.shape;
b.value[0].shape;

b.getHalo(\updateFunc).value([2,3,4,56, 789]);
b.parent.close;
*/
/////////////////////////////////////////////////////////////////////
//////////////// e.o. internal state visualisation  /////////////////
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
//////////////////////// ext. flam rout Task ////////////////////////
/////////////////////////////////////////////////////////////////////
(
q.flamrout = Task {
	var n = [2, 3, 4, 4, 4, 6, 8, 8, 16].choose;
	var dur = [1,1,2, 1.5].choose;
	var recip = n.reciprocal * dur;
	var step = [75, -75, -100, 20].choose;
	(($ )!n ++ "flam").postln;
	n.do({ |i|
		~cyclyGrn.spawn([
			\freq, (340 + (i * step) +  (Tdef(\loopYdani).envir.slDev.rand*10) * Tdef(\loopYdani).envir.slDetun),
			\index, 0, //i +5 * 0.03,
			\amp, 1,
			\dur, (2 * recip * Tdef(\loopYdani).envir.normLength).max(0.25)
		]);
		(Tdef(\loopYdani).envir.dt * recip).wait;
	})
});
q.flamrout.stop.reset.play;

/////////////////////////////////////////////////////////////////////
/////////////////////////////// GUI GUI /////////////////////////////
/////////////////////////////////////////////////////////////////////

(
{ var w, startButton, bufSl, detuneSl, lengthSl, offsPopUp, synthsPopUp, offsSl, synthKeyList;
	var  sl, arr = 0 ! 8, yDist = 160, yOffs = 100, y = 20, ezX = 250;

	q.guiLoopy = w = Window.new("make art  cycly  ja ja", Rect(0, 800, 270, yDist + yOffs + y - 75) );
	w.front;
	w.view.decorator = FlowLayout(w.view.bounds);

	NumberBox(w, Rect( 10,  10, 44, y)).value_( 15 / Tdef(\loopYdani).get(\dt) ).step_(1)
	.action_( { arg view;
		Tdef(\loopYdani).set(\dt, 15 / view.value );
	});


	Button(w, Rect( 60,  10, 149, y))
	.states_( [
		["play Task", Color.black,Color.blue],
		["stop Task", Color.black,Color.red]
	] )
	.action_( { arg view;
		// strange !!!   why not the tempo from the settings field ??
		[
			{ Tdef(\loopYdani).stop; 	      \STOPPIN.postln;},
			{ Tdef(\loopYdani).play;  ~cyclyGrn.play;    \PLAYIN.postln; }
	] [view.value].value; }
	);

	NumberBox(w, Rect( 10,  10, 44, y)).value_(   Tdef(\loopYdani).envir.beatNum  ).step_(1)
	.action_( { arg view;
		Tdef(\loopYdani).envir.beatNum =  view.value;
	});

	// controls for all relevant parameters
	w.view.decorator.nextLine;
	EZSlider(w, ezX @ y, "gain", ControlSpec(0, 4, \amp, 0),
		{|ez| ~cyclyGrn.set(\gain, ez.value ); }, 1);

	w.view.decorator.nextLine;
	lengthSl = EZSlider(w, ezX @ y, "dur", ControlSpec(0.01, 1, \exp, 0.001),
		{|ez|
			~cyclyGrn.set(\dur, ez.value );
			Tdef(\loopYdani).envir.normLength = ez.value*10
	}, 0.1);

	w.view.decorator.nextLine;
	detuneSl = EZSlider(w, ezX @ y, "detune", ControlSpec((-60), 60, \lin, 1),
		{|ez| Tdef(\loopYdani).envir.slDetun = ez.value.midiratio; }, 0);

	w.view.decorator.nextLine;
	EZSlider(w, ezX @ y, "x", ControlSpec(0, 1, \lin, 0),
		{|ez| Tdef(\loopYdani).set(\x, ez.value; ); }, 0);

	w.view.decorator.nextLine;
	offsSl = EZSlider(w, ezX @ y, "y", ControlSpec(0, 1, \lin, 0),
		{|ez| Tdef(\loopYdani).set(\y, ez.value );}, 0);



	w.view.decorator.nextLine;
	w.view.decorator.nextLine;
	Button(w, Rect(399 ,yDist*0+yOffs, 30, y))
	.states_([[".add",Color.black,Color.blue]]).value_(0)
	.action_({arg sl;
		Tdef(\loopYdani).envir.cyOffsetsList =
		Tdef(\loopYdani).envir.cyOffsetsList
		.add( offsSl.value.round(0.001).asString );
		{ offsPopUp.items = Tdef(\loopYdani).envir.cyOffsetsList }.defer;
	});

	offsPopUp = PopUpMenu(w, Rect(399, yOffs, 200, y));
	offsPopUp.items = Tdef(\loopYdani).envir.cyOffsetsList;
	offsPopUp.action = { arg sbs; var pick;
		pick = Tdef(\loopYdani).envir.cyOffsetsList.at(sbs.value).asFloat;
		~cyclyGrn.set(\offs, pick );
		{ offsSl.value_(pick) }.defer;
	};

	w.view.decorator.nextLine;

	synthsPopUp = PopUpMenu(w, Rect(399, yDist + yOffs, 200, y));
	synthsPopUp.items = q.cSynths.keys.asArray.sort.reverse;
	synthsPopUp.action = { arg sbs; var pick;
		~cyclyGrn[0] = q.cSynths[synthsPopUp.items[sbs.value]].value;
		q[\cyclyGrnAddFX].value;
	};
	{ synthsPopUp.valueAction_(2) }.defer(1);
}.value;
);

/////////////////////////////////////////////////////////////////////
/////////////////////////////// END GUI /////////////////////////////
/////////////////////////////////////////////////////////////////////