().play;
s.boot;
ServerOptions.outDevices;
Server.default.options.outDevice_("External Headphones");
Server.default.options.outDevice_("MacBook Air Speakers");
s.reboot;


//Unfortunately GUI updates threshold value but at the moment does not re-evaluate whole code block automaticallym which is desired functionality.
// for now change threshold values with ~thold (first variable below)
// then re-evaluate entire code block to hear difference

(
~thold = 0.1;
~thresholder.free;
FreqScope.new(200, 100);

(
~thresholder = {
	var parts, snd, out = 0;
	var path = "/Users/your/Directory/data/total_dos.txt";

	~freqs = Array.new;
	~amps  = Array.new;

	File.use(path, "r", { |file|
		file.readAllString.split($\n)
		.do { |line|
			if (line.notNil and: {line.size > 0 })
			{ parts = line.split($ ).reject(_.isEmpty); //skip empty lines
				if (parts.size >= 2) {    //create line breaks if less than 2 values
					var freq = parts[0].asFloat.linlin(0, 8, 100, 1100);
					var amp = parts[1].asFloat.linlin(0.001, 7, 0.1, 0.7); //check how these work with thold

					if (amp >= ~thold) {
						~freqs = ~freqs.add(freq);
						~amps = ~amps.add(amp);
					};
				};
			};
		};
	};
	);

		snd = Mix(SinOsc.ar(~freqs, Rand(0, 2pi), ~amps * 0.1));
	          Out.ar(out, snd !2);
}.play;
~thresholder.value;

"Freqs: ".post; ~freqs.postln; //these lines just print rescaled data in the SC postwindow ----------------->
"Amps : ".post; ~amps.postln;

);

w = Window.new("gui", Rect(100, 100, 300, 300)).front;
w.view.background_(Color.new255(153, 255, 102).vary).alwaysOnTop_(true);
b = ControlSpec(0.1, 0.7, \linear, 0.01); // min, max, mapping, step
c = NumberBox(w, Rect(20, 20, 145, 35)).focus;
v = Slider(w,Rect(200,20,30,250))
    .focusColor_(Color.red(alpha:0.2))
    .background_(Color.rand)
.action_({ |sl|
	c.value_(b.map(v.value));
	~thold = sl.value;
	~thresholder.value;
    });

)

~thresholder.free; //stop synth here when done
w.close; //close GUI
~thold //check value of threshold







