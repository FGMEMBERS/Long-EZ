setprop("controls/gear/brake-parking",1);
controls.adjMixture = func {
    var running = getprop("engines/engine[0]/running");
    var onground = getprop("gears/gear[0]/wow");
    if (onground and !running) {
        adjEngControl("mixture", arg[0]);
        var mixturelevel = getprop("/controls/engines/engine[0]/mixture");
        print ("Mixture level (0~1): ",mixturelevel);
    }
    else print ("mixture can't be adjusted for now");
}

var startEngine = controls.startEngine;
controls.startEngine = func(){
        var volts = getprop("systems/electrical/outputs/starter[0]");
	print("Starter Volts: ",volts);
	if (volts > 16) {
		startEngine();
	}
}

