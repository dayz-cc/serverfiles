// Ground Fog - TorturedChunk - j0k3r5 - mmmyum @ OpenDayZ.net
private ["_bsposition","_content"];
waitUntil {!isNull player};
doofog = {
private ["_obj","_pos","_fog1","_fog2","_fog3","_inVehicle"];
        _inVehicle = (vehicle player != player);
        if (_inVehicle) then {
            _obj = (vehicle player);
        } else {
            _obj = player;
        };
        _pos = position _obj;
        _fog1 = "#particlesource" createVehicleLocal _pos;
        _fog1 setParticleParams [
        ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
            [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
            [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
        ];
        _fog1 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
        _fog1 setParticleCircle [0.001, [0, 0, -0.12]];
        _fog1 setDropInterval 0.01;
        _fog2 = "#particlesource" createVehicleLocal _pos;
        _fog2 setParticleParams [
        ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
            [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
            [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
        ];
        _fog2 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
        _fog2 setParticleCircle [0.001, [0, 0, -0.12]];
        _fog2 setDropInterval 0.01;
        _fog3 = "#particlesource" createVehicleLocal _pos;
        _fog3 setParticleParams [
        ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
            [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
            [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
        ];
        _fog3 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
        _fog3 setParticleCircle [0.001, [0, 0, -0.12]];
        _fog3 setDropInterval 0.01;
        _this setVariable ["playerfog", floor time + 5];
        sleep 30;
        deleteVehicle _fog1;
        deleteVehicle _fog2;
        deleteVehicle _fog3;
    };
	
[] spawn {
    while {true} do { //only near carrier and bay
	//[8326.5879,13294.87,0.0] monolith entrance
	//[3695.9475, 6004.2476, 0.13762426] green mountain

	//if((!dayz_won_the_game)&&(player distance [13932.31, 13369.947, 0.31807569] <= 500||player distance [8326.5879,13294.87,0.0] <= 750||player distance [3695.9475, 6004.2476, 0.13762426] <= 500|| player distance GetMarkerPos "ghkbszone" <=2800)) then {
	
	/*{
			player action ["lightOff", _x];
		
	} forEach nearestObjects [player,  ["Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"], 500];
	*/
	
       // if(daytime < 5 || daytime > 18) then {
            if (player getVariable ["playerfog", -1] < time) then {
				player setVariable ["playerfog", floor time + 5];
					
				if((!dayz_won_the_game)&&(player distance [13932.31, 13369.947, 0.31807569] <= 500||player distance [8326.5879,13294.87,0.0] <= 750||player distance [3695.9475, 6004.2476, 0.13762426] <= 500|| player distance GetMarkerPos "ghkbszone" <=2800)) then {				
					player spawn doofog;
					sleep 30;
					//GHK lets allow the chance of a bloodsucker to spawn. about 50% per hour, or 1/24 per every 30 seconds. Max out at dz_max_bloodsuckers (DEFAULT =1) in 500m radius. 
					if(floor(random(24)) < 1) then {
						if(({alive _x} count ((position player) nearEntities ["ns_bloodsucker", 510])) < dz_max_bloodsuckers) then {
							_bsposition = [(position player),120,200,10,0,0,0] call BIS_fnc_findSafePos;
							_content ='this addeventhandler ["Killed",{[_this,"zombieKills"] call local_eventKillMutant}];'; 
							"uac_bloodsucker" createUnit [[(_bsposition select 0) + 10, (_bsposition select 1) - 10, 0], group sefik, _content, 1, "CORPORAL"];
							dz_bloodsucker_count = dz_bloodsucker_count + 1; // 3;
							publicVariable "dz_bloodsucker_count";
							
							private ["_ghkhint"];
							_ghkhint = ["You hear growls nearby","You hear a loud roar nearby","You hear screeching and howling nearby"] call BIS_fnc_selectRandom;
							{
								if (isPlayer _x AND (_x distance _bsposition) <= 510) then {
									 [nil, _x,"loc" + "per",rEXECVM, "custom\dzaihint.sqf",_ghkhint] call RE;
								};
							} foreach playableUnits;						
						
						};
					};
				};
				
            };
      //  };
	//  };
    };
};