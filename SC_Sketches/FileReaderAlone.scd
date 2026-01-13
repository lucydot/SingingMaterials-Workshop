().play;
s.boot;
ServerOptions.outDevices;
Server.default.options.outDevice_("External Headphones");
Server.default.options.outDevice_("MaxBook Air Speakers");
s.reboot;


(
var path = "/Users/jorgeboehringer/Documents/PROJECTS_ONGOING/SONIC_INTANGIBLES/Proj/Workshops/SingingMaterials/data/total_dos.txt";
// var path = "/Your/Complete/Directory/Goes/In/Here.txt"; // I coverted the data to .txt for eees

~freqs = Array.new; //these just make new variables that will hold the arrays
~amps  = Array.new;

/* file reading method is:
read whole thing in as big string,
then splits it into lines,
then splits this at spaces
then coverts arrays to floats (while linearly rescaling them)
then stores them into two arrays for Frequencies and Amplitudes
*/

File.use(path, "r", { |file| //"r" is an argument meaning "read"
    file.readAllString
	.split($\n)
	//I don't really understand how what arguments .split method takes but I used this in another project and   it worked...same with conditional below
        .do { |line|
            var parts;
            // below skips empty lines
            if (line.notNil and: { line.size > 0 })
               { parts = line.split($ ).reject(_.isEmpty);
			// only continue if there are at least 2 values...this creates line breaks
                if (parts.size >= 2) {

				var freq = parts[0].asFloat.linlin(0, 8, 250, 15000); // the numbers in parentheses here are the rescaling factors for frequency (and below, amplitude) these can (and probably should!) be changed.
				var amp  = parts[1].asFloat.linlin(0.001, 7, 0.1, 0.7);

                    //threshold: this can be changed or even made an element that is controllable while running
                    if (amp >= 0.001) {
                        ~freqs = ~freqs.add(freq);
                        ~amps  = ~amps.add(amp);
                    };
                };
            };
        };
});
"Freqs: ".post; ~freqs.postln; //these lines just print rescaled data in the SC postwindow ----------------->
"Amps : ".post; ~amps.postln;
)