//GHK, This script sets off the nuke chain of events, when players fail (timeout) at the 'nuke' WAI mission.
//siren is set off at nuke position for all clients, and radio message is sent to all players with radios announcing where nuke is going to explode
//siren will play for 3 minutes, then this scripts sends out publicvariables to trigger the nuke
private ["_posindex","_nukepos","_msgwarn"];
if (!isServer) exitWith {}; //Make sure this script runs only on server.
diag_log ("waifailnuke called, set off at:");diag_log((_this select 1));
diag_log((_this select 0));

_posindex = _this select 0;
_nukepos = _this select 1;

//lets get the actual index. 
switch (_posindex) do {
    case 9: {_posindex = 0; };
    case 10: { _posindex = 1; };
};

//now get the messages
switch (_posindex) do {
   case 0: {
	_msgwarn ="Chernogorsk";
   };
    case 1: { 
	_msgwarn = "Elektrozavodsk";
	};
   case 2: {_msgwarn = "Berezino"; };
    case 3: { _msgwarn = "Berezino"; };
   case 4: {_msgwarn ="International Airfield";  };
    case 5: { _msgwarn ="Krasnostav Airstrip"; };
   case 6: {_msgwarn ="Olsha"; };
    case 7: { _msgwarn ="Stary Sobor";};
    case 8: {_msgwarn =" the Border Base near Kamenka"; };
};

_msgwarn = "A bandit warlord has launched a nuke at " + _msgwarn + ". Everyone run for your lives!";
sleep 10;
[nil, nil, rEXECVM, "custom\radiomessage.sqf",format["%1",_msgwarn]] call RE;


//Give players in the area a warning every 30 seconds, if settting is on 
_a = 1;
while {_a <= 6} do {
	if(dz_nuke_alarm) then {
		[nil, nil, rSPAWN, [(getPos _nukepos)], {

		if(!isServer) then {
		if(player distance (_this select 0) <=500) then {
			
				_nuke_alarm = createSoundSource ["Sound_Alarm2", (position player), [], 0]; 
				_nuke_alarm attachto [player];

			cutText ["You hear a loud siren","PLAIN DOWN"];
			systemChat ("You hear a loud siren");
			sleep 30;deleteVehicle _nuke_alarm;
		} else {

			
			if(player distance (_this select 0) <=1000) then {
				
				_nuke_alarm = createSoundSource ["Sound_Alarm2", (position player), [], 0]; 
				
				
				cutText ["You hear a loud siren in the distance","PLAIN DOWN"];
				systemChat ("You hear a loud siren in the distance");
				sleep 30;deleteVehicle _nuke_alarm;
			} else { 
			
				if(!isNil "_nuke_alarm") then {
					deleteVehicle _nuke_alarm;
				};				
			
			};
			
			
		};
		};
		}] call RE;
	};
sleep 30;
_a = _a + 1;};

//finally clear up any attached sirens
[nil, nil, rSPAWN, [(getPos _nukepos)], {
	
		if(!isNil "_nuke_alarm") then {
				deleteVehicle _nuke_alarm;
		};				

}] call RE;

//just 3 minutes, should give players who hear a siren enough time to run more than 1000m from ground zero

//now send the correct publicvariable out to clients to trigger the nuke!
switch (_posindex) do {
   case 0: {
	 nuke_detonate1 = true;
	 publicVariable "nuke_detonate1";
	nuke_detonate = true;
	publicVariable "nuke_detonate"; 
   };
    case 1: { 
	nuke_detonate2 = true;
	 publicVariable "nuke_detonate2";
	 nuke_detonate = true;
	publicVariable "nuke_detonate"; 
	};
   case 2: {
	 nuke_detonate3 = true;
	 publicVariable "nuke_detonate3";
	 nuke_detonate = true;
	publicVariable "nuke_detonate"; 
   };
    case 3: { 
	nuke_detonate4 = true;
	publicVariable "nuke_detonate4";
	nuke_detonate = true;
	publicVariable "nuke_detonate"; 
	};
   case 4: {
   nuke_detonate5 = true;
	publicVariable "nuke_detonate5";
	nuke_detonate = true;
	publicVariable "nuke_detonate"; 
   };
    case 5: { 
	nuke_detonate6 = true;
	publicVariable "nuke_detonate6";
	nuke_detonate = true;
	publicVariable "nuke_detonate"; 
	};
   case 6: {
	nuke_detonate7 = true;
	publicVariable "nuke_detonate7";
	nuke_detonate = true;
	publicVariable "nuke_detonate"; 

   };
    case 7: {
	nuke_detonate8 = true;
	 publicVariable "nuke_detonate8";
	 nuke_detonate = true;
	publicVariable "nuke_detonate"; 	
	};
    case 8: {
	nuke_detonate9 = true;
	publicVariable "nuke_detonate9";
	nuke_detonate = true;
	publicVariable "nuke_detonate"; 
	};
};


