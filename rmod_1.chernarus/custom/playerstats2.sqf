diag_log("playerstats2 called");
//max of every 5 seconds ask the server for the new scoreboard
if(time-dz_scoreboard_time > 5) then {
	diag_log("playerstats2 ghkplayerstats set for server");
	ghkplayerstats = [time,player]; 
	publicVariableServer "ghkplayerstats"; 
	dz_scoreboard_time=time;
};
//display what server sent back:
hintSilent parseText dz_scoreboard;