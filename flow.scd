// ESCALAS
(
~scl = ~scl ? (
    aeol: Scale.aeolian,
    ahir: Scale.ahirbhairav,
    ajam: Scale.ajam,
    atha: Scale.atharKurd,
    augm: Scale.augmented,
    aug2: Scale.augmented2,
    bart: Scale.bartok,
    bast: Scale.bastanikar,
    baya: Scale.bayati,
    bhai: Scale.bhairav,
    chin: Scale.chinese,
    chro: Scale.chromatic,
    chr24:Scale.chromatic24,
    dimi: Scale.diminished,
    dim2: Scale.diminished2,
    dori: Scale.dorian,
    egyp: Scale.egyptian,
    enig: Scale.enigmatic,
    fara: Scale.farahfaza,
    gong: Scale.gong,
    harM: Scale.harmonicMajor,
    harm: Scale.harmonicMinor,
    hexA: Scale.hexAeolian,
    hexD: Scale.hexDorian,
    hexM6:Scale.hexMajor6,
    hexM7:Scale.hexMajor7,
    hexP: Scale.hexPhrygian,
    hexS: Scale.hexSus,
    hija: Scale.hijaz,
    hijD: Scale.hijazDesc,
    hijK: Scale.hijazKar,
    hind: Scale.hindu,
    hira: Scale.hirajoshi,
    hunm: Scale.hungarianMinor,
    huss: Scale.husseini,
    huza: Scale.huzam,
    indi: Scale.indian,
    ioni: Scale.ionian,
    iraq: Scale.iraq,
    iwat: Scale.iwato,
    jiao: Scale.jiao,
    jiha: Scale.jiharkah,
    karj: Scale.karjighar,
    kijK: Scale.kijazKarKurd,
    kumo: Scale.kumoi,
    kurd: Scale.kurd,
    leaW: Scale.leadingWhole,
    locr: Scale.locrian,
    locM: Scale.locrianMajor,
    lydi: Scale.lydian,
    lydm: Scale.lydianMinor,
    mahu: Scale.mahur,
    majo: Scale.major,
    majP: Scale.majorPentatonic,
    marv: Scale.marva,
    melM: Scale.melodicMajor,
    melm: Scale.melodicMinor,
    melmD:Scale.melodicMinorDesc,
    mino: Scale.minor,
    minP: Scale.minorPentatonic,
    mixo: Scale.mixolydian,
    mura: Scale.murassah,
    must: Scale.mustar,
    naha: Scale.nahawand,
    nahD: Scale.nahawandDesc,
    nair: Scale.nairuz,
    nawA: Scale.nawaAthar,
    neaM: Scale.neapolitanMajor,
    neam: Scale.neapolitanMinor,
    nikr: Scale.nikriz,
    par1: Scale.partch_o1,
    par2: Scale.partch_o2,
    par3: Scale.partch_o3,
    par4: Scale.partch_o4,
    par5: Scale.partch_o5,
    par6: Scale.partch_o6,
    paru1:Scale.partch_u1,
    paru2:Scale.partch_u2,
    paru3:Scale.partch_u3,
    paru4:Scale.partch_u4,
    paru5:Scale.partch_u5,
    paru6:Scale.partch_u6,
    pelo: Scale.pelog,
    phry: Scale.phrygian,
    prom: Scale.prometheus,
    purv: Scale.purvi,
    rast: Scale.rast,
    rasD: Scale.rastDesc,
    ritu: Scale.ritusen,
    romm: Scale.romanianMinor,
    saba: Scale.saba,
    scri: Scale.scriabin,
    shan: Scale.shang,
    shaA: Scale.shawqAfza,
    sika: Scale.sikah,
    sikD: Scale.sikahDesc,
    span: Scale.spanish,
    supL: Scale.superLocrian,
    suzn: Scale.suznak,
    todi: Scale.todi,
    usha: Scale.ushaqMashri,
    whol: Scale.whole,
    yaka: Scale.yakah,
    yakD: Scale.yakahDesc,
    yu:   Scale.yu,
    zamz: Scale.zamzam,
    zanj: Scale.zanjaran,
    zhi:  Scale.zhi,
);
);
~scale = Pdefn(\scale, ~scl.choose.postln );
// (
// fork{
//     Pdefn(\scale).source.name;
//     Pdefn(\scale).source.tuning;
//
//     // ~deltas = Bus.control(s, 4).setn(1!4);
//     // ~busses = dirt.orbits.collect { |x| x.outBus };
//     s.sync;
// };
// );

//////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// DREGREES //////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
(
~deg = (
    diaA: [-2, 0, 2],
    diaB: [-1, 1, 3],
    diaC: [-7, -5, -3],
    diaD: [-6, -4, -2],
    diaE: [-5, -3, -1],
    diaF: [-4, -2, 0],
    diaG: [-3, -1, 1],
    dim: [ 0, 1, 3, 4, 6, 7, 9, 10 ],
    dim2:[ 0, 2, 3, 5, 6, 8, 9, 11 ],
    aug: [ 0, 3, 4, 7, 8, 11 ],
    aug2:[ 0, 1, 4, 5, 8, 9 ],
    aeol: [ 0, 2, 3, 5, 7, 8, 10 ],
    ahir: [ 0, 1, 4, 5, 7, 9, 10 ],
    ajam: [ 0, 4, 8, 10, 14, 18, 22 ],
    atha: [ 0, 2, 6, 12, 14, 16, 22 ],
    bart: [ 0, 2, 4, 5, 7, 8, 10 ],
    bast: [ 0, 3, 7, 10, 13, 15, 21 ],
    baya: [ 0, 3, 6, 10, 14, 16, 20 ],
    bhai: [ 0, 1, 4, 5, 7, 8, 11 ],
    chin: [ 0, 4, 6, 7, 11 ],
    dori: [ 0, 2, 3, 5, 7, 9, 10 ],
    egyp: [ 0, 2, 5, 7, 10 ],
    enig: [ 0, 1, 4, 6, 8, 10, 11 ],
    fara: [ 0, 4, 6, 10, 14, 16, 20 ],
    gong: [ 0, 2, 4, 7, 9 ],
    tb303: [0, 0, 5, -7, -7, -7, -7, -7]
)
);

~pdeg = ~pdeg ? (
    a: Pdefn( \deg1, Pslide((0..5).mirror, inf, 3, 2) ),
    // Pdefn( \deg2, Pstutter(Pwhite(1, 4, inf), Pwhite(-4, 3, inf))),
    b: Pdefn( \deg2, Pseq( [ Pseries(-7, 2, 9), Pseries(11, -2, 9) ], inf)),
    c: Pdefn( \deg3, Pseq( [ Pseries(-11, 0.5, 33), Pseries(11, -0.5, 33) ], inf)),
    d: Pdefn( \deg4, Pseq( [
            Pn( Pseries( { rrand(0, 7) }, 1, { rrand(4, 8) } ), 2 ),
            Pseries( { rrand(7, 14) }, -1, { rrand(4, 8) })
    ], inf ) ),
    e: Pdefn( \deg5, Ptuple( [
        Pseries(7, -1, 8), Prand([9, 7, 7, 7, 4, 4, 2, 2], 1), Prand([4, 4, 4, 2, 2, 0, 0, -3], 1)
    ], inf ) ),
    f: Pdefn( \deg6, Pseq( [
        Pseq( [ -2, Pxrand( [ [ 2, 5, 9 ], [ 2, 5, 7 ], [ 0, 5, 7 ] ] ) ], 1 ),
        Pseq( [ 0, Pxrand( [ [ 2, 5, 7 ], [ 0, 5, 7 ], [ 2, 3, 7 ] ] ) ], 1 ),
        Pseq( [ -2, Pxrand( [ [ 0, 5, 7 ], [ 2, 3, 7 ], [ 2, 5, 8 ] ] ) ],  1 ),
        Pseq( [ 0, Pxrand( [ [ 2, 3, 7 ], [ 2, 5, 8 ], [ 1, 5, 10 ] ] ) ],  1 ),
        Pseq( [ -2, Pxrand( [ [ 2, 5, 8 ], [ 1, 5, 10 ], [ 1, 3, 6 ] ] ) ], 1 ),
        Pseq( [ 0, Pxrand ( [ [ 1, 5, 10 ], [ 1, 3, 6 ], [ 3, 7, 9 ] ] ) ], 1 ),
        Pseq( [ -2, Pxrand( [ [ 1, 3, 6 ], [ 3, 7, 9 ] ] ) ], 1 ),
        Pseq( [ 0, Pxrand([ 3, 7, 9 ]) ],  1 )
    ], inf) ),
    g: Pdefn( \deg7, Prand( [
        [ [2,-2], [3,-3] ], [ [-4,6],4,-7 ],-4, 10, [0,8], [ 6,-8,[-2,4] ], [10,0,4], -4, [4,-4,0,-6], 6, 10, 0, -2
    ], inf ) ),
    h: Pdefn( \deg8, Prand( [
        Pwalk( [8-5,-3,2,4,7], Prand( [-1,-2,0,1,2], inf ), Pseq( [-1,1], inf) ),
        Pwalk( (-12..12), Prand( [-2,-1,0,1,2], inf), Prand( [-1,1], inf) )
    ], inf ) + Pstutter( 32, Pseq( [6,12,-4,0], inf ), inf, 1 ) - 12 ),
    i: Pdefn( \deg9, Pexprand( 1, 8.0, inf ).round(0.1) ),
);
{
    var n = 10,
    scaleSegments = Array.fill(n, { |i|
        if(i.odd)
        { Pseries(11, -1, rrand(1, 5))}
        { Pseries(rrand(-6, 2), { rrand(1, 4) }, i+1) }
    });
    ~pdeg.j = Pdefn( \deg0, Pswitch(scaleSegments, Prand([Pwhite(0, n-1, 4), Pwhite(0, n-1, 1).select(_.odd)], inf)))
}.fork;

~acrd = ~acrd ? (
    place: Ppatlace( [ Pn( Pgeom( [1, 1.5, 2], [2, 1, 1.5], 5), 5 ), [0, [0, 12] ] ].scramble, 5 ),
);

///////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// DURATIONS //////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////// Bjorklund (traditional rhythms) ////////////////////////
~dur = ~dur ? (
    // Pdefn( \dur1, Pn( Pif( Ptime(inf) < 4.0, Pgeom.fromEndpoints(1, 0.2, 16), Pif( Ptime(inf) < 8.0, Pgeom.fromEndpoints(0.2, 1, 16) )),inf) );
    a: [ 1, 0.5, 1, 0.25, 0.25, 0.75, 1, 2, 1/3, 1/3, 1/3, 2/3, 2/3, 2/3 ],
    b: [ 1, 0.5, 1, 0.25, 0.25, 1, 2, 2/3, 2/3, 2/3 ],
    // Pdefn( \dur4, Pn(Pif(Ptime(inf) < 32.0, Pgeom.fromEndpoints(1, 0.1, 32), Pgeom.fromEndpoints(0.1, 1, 32))));
    c: [ 1, 2, 1, 1, 2, 1, 2, 2 ],
    d: [ 1, 0.5, 1, 0.5, 1],
    e: [ 1, 0.75, 0.5, 0.25, 1, 0.5 ],
    f: [1, 0.5, 1],
    // Amencatu
    maracatu: [3,2,3,3,5] / 16 * 2 + (1/3),
    a2: 1 / 16 * 2 + (1/3),
    a3: [2,1,2,2,1,2,1,5] / 16 * 2 + (1/3),
    // Bjorklund
    b1: [ 3, 3, 2, 3, 3, 2, 3, 3 ] / 2,
    b2: [ 2, 1, 2, 1, 2, 2, 1, 2 ] / 2,
    b3: [ 2, 1, 1, 2, 1, 1, 2, 1 ] / 2,
    b4: [ 1, 1, 1, 1, 1, 1, 2, 1 ] / 2,
    b5: [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ] / 3,
    b6: [ 3, 3, 3, 3, 4, 3, 3, 3, 3, 4, 3, 3, 3, 3, 4, 3 ] / 4,
    b7: [ 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2 ] / 4,
    b8: [ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ] / 8,
    b9: [ 7, 6, 7, 6, 6, 7, 6, 7, 6, 6, 7, 6, 7, 6, 6, 7, 6, 7, 6, 6, 7, 6, 7, 6, 6, 7, 6, 7, 6, 6, 7, 6 ] / 8,
    b10: [ 3, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 3, 2 ] / 8,
    b11: [ 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2 ] / 8,
    b12: [ 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ] / 8,
);
~pdur = ~pdur ? (
    // Pdefn( \dur1, Pn( Pif( Ptime(inf) < 4.0, Pgeom.fromEndpoints(1, 0.2, 16), Pif( Ptime(inf) < 8.0, Pgeom.fromEndpoints(0.2, 1, 16) )),inf) );
    a: Pdefn( \dur1, Prand([ 1, 0.5, 1, 0.25, 0.25, 0.75, 1, 2, Pn(1/3,3), Pn(2/3,3)], inf)),
    b: Pdefn( \dur2, Prand( [ 1, 0.5, 1, 0.25, 0.25, 1, 2, Pn(2/3,3) ], inf)),
    // Pdefn( \dur4, Pn(Pif(Ptime(inf) < 32.0, Pgeom.fromEndpoints(1, 0.1, 32), Pgeom.fromEndpoints(0.1, 1, 32))));
    c: Pdefn( \dur3, Pseq( [ 1, 2, 1, 1, 2, 1, 2, 2 ], inf )),
    d: Pdefn( \dur4, Pseq([1, 0.5, 1, 0.5, 1], inf)),
    e: Pdefn( \dur5, Pseq([1, 0.75, 0.5, 0.25, 1, 0.5,], inf)),
    f: Pdefn( \dur6, Pseq([1, 0.5, 1], inf)),
    // Amencatu
    a1: Pdefn( \dura1, Pseq( [3,2,3,3,5] / 16 * 2 + (1/3), inf) ),
    a2: Pdefn( \dura2, Pseq( [1] / 16 * 2.3333, inf) ),
    a3: Pdefn( \dura3, Pseq([2,1,2,2,1,2,1,5] / 16 * 2 + (1/3), inf) ),
    // Bjorklund
    b1: Pdefn( \durb1, Pbjorklund2( 3, 8 ) * 0.5),//, \dur, 1/2
    b2: Pdefn( \durb2, Pbjorklund2( 5, 8 ) * 0.5),//, \dur, 1/2
    b3: Pdefn( \durb3, Pbjorklund2( 6, 8 ) * 0.5),//, \dur, 1/2
    b4: Pdefn( \durb4, Pbjorklund2( 7, 8 ) * 0.5),//, \dur, 1/2
    b5: Pdefn( \durb5, Pbjorklund2( 6, 12 ) * 0.333333),//, \dur, 1/3
    b6: Pdefn( \durb6, Pbjorklund2( 3, 8 ) * 0.25),//, \dur, 1/4
    b7: Pdefn( \durb7, Pbjorklund2( 5, 16 ) * 0.25),//, \dur, 1/4
    b8: Pdefn( \durb8, Pbjorklund2( 11, 32 ) * 0.25),//, \dur, 1/4
    b9: Pdefn( \durb9, Pbjorklund2( 5, 32 ) * 0.25),//, \dur, 1/4
    b10: Pdefn( \durb10, Pbjorklund2( 15, 32 ) * 0.25),//, \dur, 1/4
    b11: Pdefn( \durb11, Pbjorklund2( Pseq( [  9, 7, 6, 5, 4, 3, 2, 1 ], inf ), 8 ) * 0.125 ),//, \dur, 1/8
    b12: Pdefn( \durb12, Pbjorklund2( Pxrand( (1..16), inf ), 16 ) * (1/9)),//, \dur, 1/9  ;
    b13: Pdefn( \durb13, Pbjorklund2( Pxrand( (1..16), inf ), 8 ) * (1/12)),//, \dur, 1/12  ;
    b14: Pdefn( \durb14, Pbjorklund2( 3, 8 ) * 0.25),//, \dur, 1/4
    b15: Pdefn( \durb15, Pbjorklund2( 5, 8 ) * 0.25),//, \dur, 1/4
    b16: Pdefn( \durb16, Pbjorklund2( 9, 16 ) * 0.25),//, \dur, 1/4
    b17: Pdefn( \durb17, Pbjorklund2( 17, 32 ) * 0.25),//, \dur, 1/4
    b18: Pdefn( \durb18, Pbjorklund2( 11, 32 ) * 0.25),//, \dur, 1/4
);

/////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// SOUND! /////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

//////////////////////////////// LEGATO /////////////////////////////////////////
~leg = ~leg ? (
    a: (0.2, 0.2 + (1/256) .. 1.1),  // from normal-short to long
    b: [ 0.281, 0.972, 0.267, 1.118, 0.529, 1.864, 0.391, 1.228, 1.219, 0.418, 0.489, 0.234, 0.539, 0.212, 0.716, 1.355, 1.599, 0.835, 0.307, 1.416, 0.855, 0.374, 1.526, 1.92, 0.65, 0.585, 1.43, 1.0, 0.279, 0.6, 0.645, 0.826, 0.494, 1.33, 0.339, 0.607, 0.347, 0.353, 0.251, 1.154, 0.393, 0.248, 1.004, 0.27, 0.784, 0.279, 1.067, 1.42, 0.404, 0.221, 0.901, 0.326, 0.262, 0.647, 1.085, 1.134, 1.168, 0.367, 1.916, 1.183, 0.273, 0.229, 0.25, 0.213 ],  // exponential random from - short to very long, overlaping notes
);
~pleg = ~pleg ? (
    a: Pdefn(\leg1, Pn(Penv( [0.2, 1.1],  [256], \exp))),  // from normal-short to long
    b: Pdefn(\leg2, Pexprand(0.2, 2)),  // exponential random from - short to very long, overlaping notes
    c: Pdefn(\legacid,Pwrand([0.1,0.5,1.2,1.8],[0.1,0.5,0.2,0.2],inf)).clock_(t),
    d: Pdefn(\duracid,Pseq([0.25,0.125,0.125,0.25,0.125,0.125,0.125,0.25,0.125,0.25,0.125],inf) * 1).clock_(t),
);

////////////////////////////// ATTACK TIME ///////////////////////////////////////
~att = ~att ? (
    // random short
    a: [ 0.036, 0.023, 0.004, 0.02, 0.029, 0.017, 0.021, 0.035, 0.023, 0.03, 0.012, 0.004, 0.03, 0.009, 0.035, 0.009, 0.038, 0.02, 0.035, 0.037, 0.013, 0.017, 0.037, 0.006, 0.015, 0.02, 0.038, 0.028, 0.009, 0.011, 0.039, 0.016, 0.019, 0.016, 0.006, 0.027, 0.032, 0.01, 0.039, 0.01, 0.022, 0.017, 0.015, 0.005, 0.037, 0.017, 0.024, 0.005, 0.033, 0.029, 0.035, 0.005, 0.036, 0.028, 0.005, 0.017, 0.023, 0.027, 0.02, 0.026, 0.019, 0.039, 0.032, 0.025 ],
    // random exp short long
    b: [ 0.036, 0.006, 0.009, 0.004, 0.012, 0.005, 0.006, 0.007, 0.049, 0.094, 0.043, 0.013, 0.009, 0.017, 0.005, 0.013, 0.01, 0.006, 0.004, 0.057, 0.012, 0.054, 0.024, 0.007, 0.006, 0.013, 0.006, 0.033, 0.026, 0.005, 0.051, 0.005, 0.009, 0.021, 0.049, 0.046, 0.064, 0.058, 0.072, 0.088, 0.053, 0.007, 0.086, 0.011, 0.084, 0.018, 0.014, 0.027, 0.038, 0.062, 0.016, 0.005, 0.008, 0.072, 0.008, 0.005, 0.005, 0.015, 0.013, 0.017, 0.019, 0.051, 0.034, 0.01 ],
    // from short to long
    c: ( 0.004, 0.004 + (1/256).. 0.2 ),
);
~patt = ~patt ? (
    a: Pdefn(\att1, Pbrown(0.004, 0.04) ),  // random short
    b: Pdefn(\att2, Pexprand(0.004, 0.1) ),  // random exp short long
    c: Pdefn(\att3, Pn(Penv( [0.004, 0.2], [256], \lin))),  // from short to long
);

////////////////////////////// DECAY TIME ///////////////////////////////////////
~dec = ~dec ? (
    a: (0.2, 0.2 + (1/256) .. 0.6).sin,  // from short to long
    b: (0.6, 0.6 - (1/256) .. 0.2).sin,  // from long to short
);
~pdec = ~pdec ? (
    a: Pdefn( \dec1, Pn( Penv( [0.2, 0.6], [256], \sin ) ) ),  // from short to long
    b: Pdefn( \dec2, Pn( Penv( [0.6, 0.2], [256], \sin ) ) ),  // from long to short
);

///////////////////////////// RELEASE TIME //////////////////////////////////////
~rel = ~rel ? (
    a: ( 0.2, 0.2 + (1/256) .. 0.6 ).linexp( 0.2, 0.6, 0.2, 0.6 ),  // from short to long
    b: ( 0.6, 0.6 - (1/256) .. 0.2 ).linexp( 0.6, 0.2, 0.6, 0.2 ),  // from long to short
);
~prel = ~prel ? (
    a: Pdefn(\rel1, Pn(Penv( [0.2, 0.6], [256], \exp))),  // from short to long
    b: Pdefn(\dec2, Pn(Penv(#[0.6, 0.2], #[256], \exp))),  // from long to short
);

///////////////////////////// SUSTAIN LEVEL /////////////////////////////////////
~sus = ~sus ? (
    a: (0, 1/256 .. 1).lincurve(0, 1, 0, 1, 4),  // from soft to normal
);
~psus = ~psus ? (
    a: Pdefn( \sus1, Pn( Penv( [0, 1], #[512], -4) ) ),  // from soft to normal
);

///////////////////////////// FOLD (sound curves) ///////////////////////////////
~pfold = (
    a: Pdefn(\folda, Pn(Penv(#[ 1, 0.2 ], #[ 512 ], \sin  ))),  // from normal to distorted, infinite
    b: Pdefn(\foldb, Penv(#[ 0.2, 1 ], #[ 512 ], \sin  )),  // from distorted to normal, finite
);

///////////////////////////// DISTORT (formands) ////////////////////////////////
~pdist = (
    a: Pdefn(\dista, Pn(Penv(#[0.05, 0.02, 0.05, 0.08], #[128, 128, 128], [4, \sin,-4]))),  // around low dist.
    b: Pdefn(\distb, Pseq( [ 0.5, 1 ], inf )), // 0.5 and 1 - from normal to very distorted
    c: Pdefn(\distc, Penv(#[ 1.0, 2.0 ], #[ 512 ], \exp )), // alternates between high dist.
);

//////////////////////////////////// PAN ////////////////////////////////////////
~pan = (
    a: Pdefn( \pan_brown, Pbrown(-1.0, 1) ),
    b: Pdefn( \pan_c2r, Penv( [ 0, 0.5 ], [ 256 ], \lin ) ), // center to right.
    c: Pdefn( \pan_c2l, Penv( [ 0, -0.5 ], [ 256 ],\lin ) ), // center to left.
);

//////////////////////////////////// AMP ////////////////////////////////////////
~pamp = Pdefn(\amp_l2s, Penv( [ 1.0, 0.5 ],  [ 512 ], \exp ) );  // from loud to soft.


~pwalk = Pdefn(\walk, Pwalk( (0, 0.1..1), Pwrand( (-2..2), [1, 3, 5, 3, 1].normalizeSum, inf), 1, 10.rand ) );
~pvai = Pdefn(\vai, Pn( Penv( [0, 1.0], [8], \sin ) ) );
~pvolta = Pdefn(\volta, Pn( Penv( [1.0, 0], [8], \sin ) ) );

/////////// Array Stuff ////////////////

~bell = Array.fill(64, {|i| i.linlin(0,64,1.5pi,3.5pi).sin + 1}).normalize.plot;
~ponta = Array.fill(64, {|i| i.linexp(0,64,1.5pi,2pi).sin }).mirror.normalize;
~dente = (0..1023).normalize(-10, 10).collect { |num| num.lcurve }.mirror;
~gauss = (0..128).normalize.mirror.collect { |num| gauss(0.0, num) }.normalize.plot;
~walk = (Pwalk( (0, 0.1..1), Pwrand( (-2..2), [1, 3, 5, 3, 1].normalizeSum, inf), 1, 10.rand )).asStream.nextN(1024);



/*
(0..64).normalize(1.5pi, 3.5pi).sin.plot;
(0..64).linexp(0,64,0.01,1).sin.plot;
b = (0..64).linexp(0,64,0.01,1).sin.mirror.plot;
*/
////////////////////////////////////////

//////////////// Pbindf ////////////////
/*
(
Pbindf( xxxx,
\type, \set,
\mtranspose, -2,
\octave, -7,
\root, -5,
\degree, Prand(Pdefn(\scaleA).source.degrees, inf) - 3,
// \degree, Pdefn(\deg1),
\dur, Pdefn( \dur7)*2,
).play(t).quant_(4);
)
(
Pbindf( xxx,
\scalesize, Pwhite(0, Pfunc{ Pdefn(\scale).source.degrees.size }),
\degree, Pindex(Pdefn(\scale).source.degrees, Pkey(\scalesize), inf ),
\tuning, Pindex(Pdefn(\scale).source.tuning, Pkey(\scalesize), inf ),
\mtranspose, 0, //-5,
\dist, Pwhite(0.04, 0.2),
\dur, Pbjorklund2(5, 8)*16,
\slide, 0.4,
\amp, 1,
).play(t).quant_(4);
)
(
Pbindf( xxxx,
\scalesize, Pwhite(0, dsize),
\degree, Pindex(Pdefn(\scale).source.degrees, Pkey(\scalesize), inf ), \tuning, Pindex(Pdefn(\scale).source.tuning, Pkey(\scalesize), inf ),
\mtranspose, -7,
\dur, Pbjorklund2(4, 6)*4,
\amp, 0.8
).play(t).quant_(4);
)
(
Pbindf( xxxx,
\scalesize, Pwhite(0, dsize),
\degree, Prand([ 0, -1, -3, -4, -7 ], inf) - 5,
// \octave, -3,
// \root, 9,
\mtranspose, -1,
\dur, Pbjorklund2(9, 16),
\amp, 0.8
).play(t).quant_(4);
)
*/

///////////// MODS /////////////////////
/*
Ndef(\lfo, { 2 ** LFNoise2.kr(0.2) }); // rate
////////////////////////////////////////
{
Pbindef(\orb1);
0.1.wait;
Pbindef(\orb1, \tzu, 0.001)
0.1.wait;
Pbindef(\orb1).fadeTime_(0);
0.1.wait;
Pbindef(\orb1).quant_(p.quant);
Pbindef(\orb1)

Pbindef(\orb2);
0.1.wait;
Pbindef(\orb2).clock_(p.clock.tempo);
0.1.wait;
Pbindef(\orb2).fadeTime_(0);
0.1.wait;
Pbindef(\orb2).quant_(p.quant);
Pdef(\orb2).play(p.clock);

Pbindef(\orb3);
0.1.wait;
Pbindef(\orb3).clock_(p.clock.tempo);
0.1.wait;
Pbindef(\orb3).fadeTime_(0);
0.1.wait;
Pbindef(\orb3).quant_(p.quant);
Pbindef(\orb3).play(p.clock);
1+3
Pbindef(\say).clock_(p.clock.tempo);
Pbindef(\say).quant_(p.quant);
Pbindef(\say).play(quant:4);
/*
0.1.wait;
~linkModPset = PdefPreset( Pdef(\linkmod) );
( ~thisDir ++ "/linkModPset.pxpreset.scd").notNil.if {~linkModPset.loadSettings( ~thisDir ++ "/linkModPset.pxpreset.scd")}{"there's no pset linkmod pset file yet'"};
{ ~linkModPsetGui = PdefPresetGui(~linkModPset, 12).moveTo(220, 25) }.defer;*/

}.fork
t = t ?? TempoClock(110/60/2).permanent_(true);
*/

///////////////////////////// Tempo Sync LFO in Patterns /////////////////////////////
/*
SynthDef(\temposync, {
| gate=1 tempo=1 tbeat=0 amp=0.5 pan=0 out=0 |
var env, mult, sel, tmult, output;
env = Env.asr(0.05, 1, 0.05).kr(2, gate);
mult = 1;
sel = MouseY.kr(6, 0).round;
tmult = tempo*mult;
output = Select.ar(sel, [
Impulse.ar(tmult, (tbeat*mult)%1),
SinOsc.ar(tmult, (tbeat*mult*2pi)%2pi),
LFTri.ar(tmult, (tbeat*mult*4)%4), // 2
LFSaw.ar(tmult, (tbeat*mult*2)%2),
Saw.ar(tmult), // 4.
LFPulse.ar(tmult, (tbeat*mult)%1)*2-1,
Pulse.ar(tmult), // 6.
]); // NOTE: Saw and Pulse are not syncable because they have no phase inputs...
output = LPF.ar(BrownNoise.ar, output.exprange(20,20000));
Out.ar(out, Pan2.ar(output, pan, env * amp));
}).add;

Pdef(\lfo_demo, Pbind(\instrument, \temposync,
\dur, Pwhite(0.1, 1.0, inf),
\legato, 1,
\tbeat, Pfunc({thisThread.clock.beats}),
\tempo, Pfunc({thisThread.clock.tempo}),
));

Pdef(\lfo_demo).gui;
*/
