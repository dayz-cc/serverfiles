scriptName "fn_dzn_snowfall.sqf";
/*
	File: fn_dzn_snowfall.sqf
	Author: Sumrak

	Description:
	 Simple snowfall script for Namalsk OR DayZ: Namalsk

	Parameter(s):
	 _this select 0: Double - time (default 3.0)
	 _this select 1: Double - density (can be 0 - 1, default 0.5)

	Returns:
	 Nice snow particle effect with a proper density and for the defined time.
*/

private["_dzn_snow_density", "_dzn_snow_pc", "_dzn_snow_timer", "_isinbuilding"];

//GHK, these spawns just accumulate. Lets cut them off at 10. 
if(ghk_weather_thread_cnt == 10) exitWith {ghk_weather_thread_cnt = ghk_weather_thread_cnt - 1;};

if (isNil "_this") then {
	_this = [];
};
if (count _this > 0) then {
	_dzn_snow_timer = abs (_this select 0);
} else {
	_dzn_snow_timer = 3;
};
if (count _this > 1) then {
	if ((_this select 1) != -1) then {
		_dzn_snow_density = abs ( 100 * (_this select 1));
	} else {
		_dzn_snow_density = 0;
	};
} else {
	_dzn_snow_density = 50;
};

private["_inVehicle","_pos","_obj","_fog1","_fog2","_fog3","_snow"];

_d = 35;
_h = 18;
_dzn_snow_pc = 0;
snow = _dzn_snow_density / 100;
_snow = snow;
//diag_log("GHK snowfall start");
while {_dzn_snow_timer >= 0} do {
	0 setRain 0;
//diag_log("GHK snowfall");diag_log(_snow);
	_position = getPos player;
	_inVehicle = (vehicle player != player);
        if (_inVehicle) then {
            _obj = (vehicle player);
        } else {
            _obj = player;
        };
 
       _pos = position _obj;
	_pos = position (vehicle _obj);
	
	
	if ([player] call fnc_isInsideBuilding) then {
		_isinbuilding	= true;
		
		//diag_log("GHK in building");
         
	} else {
		_isinbuilding	= false;
		 if ((_snow >= 0.7)) then {
			//diag_log("GHK start snowstorm");
			setWind [0, -5, true];
			// filmgrain, seems a little too grainy at the moment
			//"filmGrain" ppEffectEnable true;
			//"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
			//"filmGrain" ppEffectCommit 5;		
			 
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
			//-- ground fog end --

			

         };		 
	};
	

	
	
	
	while {(_dzn_snow_pc < _dzn_snow_density) && !_isinbuilding } do {
		0 setRain 0;
		//diag_log("GHK light snows");
		_d = 35;
		_h = 18;
		_h2 = 7;
		_h3 = 10;
		_h4 = 2;
		_h5 = 10;
		
		_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h)];
		drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
		
		if((_snow >= 0.3)&&(_snow < 0.7)) then {
			//diag_log("GHK medium snows");
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h2)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
				 
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h3)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
		};
		if((_snow >= 0.7)) then {
		
		_d = 20;
		_h = 15;
		_h2 = 7;
		_h3 = 4;
		_h4 = 2;
		_h5 = 10;
			//diag_log("GHK heavy snows called");
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
			 
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h2)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
			 
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h3)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
			 
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h4)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];
			 
			_dpos = [((_position select 0) + (_d - (random (2 * _d))) + ((velocity vehicle player select 0) * 6)), ((_position select 1) + (_d - (random (2 * _d))) + ((velocity vehicle player select 1) * 6)), ((_position select 2) + _h5)];
			drop ["\ca\data\cl_water", "", "Billboard", 1, 8, _dpos, wind, 1, 0.0001, 0.0, 0.5, [0.05, 0.05, 0.05], [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 0], 0.2, 1.2, "", "", ""];

		
		};
		
		_dzn_snow_pc = _dzn_snow_pc + 1;
	};
	
	
	sleep 0.1;
	_dzn_snow_timer = _dzn_snow_timer - 0.1;
	_dzn_snow_pc = 0;
	if((_snow >= 0.7)&& !_isinbuilding) then {
	 deleteVehicle _fog1;
     deleteVehicle _fog2;
     deleteVehicle _fog3;
	 };
};
snow = 0;
//diag_log("GHK snowfall stop");
//GHK Cleanup any snow_storm generated
if ((_snow >= 0.7)) then {
			//diag_log("GHK final terminate snowstorm");

};
ghk_weather_thread_cnt = ghk_weather_thread_cnt - 1;
