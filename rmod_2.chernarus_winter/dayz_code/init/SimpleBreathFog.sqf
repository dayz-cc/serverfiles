// Foggy breath 20110122

private ["_unit"];
_unit = _this select 0;
_int = _this select 1; //intensity of fog (0 to 1)
while {true} do {
waituntil {isplayer player};
_unit=player;
if(r_player_blood > 0) then { //GHK (alive _unit) check not good for MP here.
//sleep (2 + random 2); // random time between breaths

private["_vel","_pos","_speed","_cycle","_intensity"];
		_pos = 		getPos _unit;
		_vel = 		velocity _unit;
		_speed = 	round((_vel distance [0,0,0]) * 3.5);
		
		if (_speed >= 0 && _speed <= 7) then {
			_cycle = 2.2;
			_intensity = 0.07;
		} else {
			if (_speed > 7 && _speed <= 18) then {
				_cycle = 1.2;
				_intensity = 0.13;
			} else {
				_cycle = 0.6;
				_intensity = 0.25;
			};
		};
		
		sleep _cycle;
_source = "logic" createVehicleLocal (getpos _unit);
	_fog = "#particlesource" createVehicleLocal getpos _source;
	_fog setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],
	"", 
	"Billboard", 
	0.5, 
	0.5, 
	[0,0,0],
	[0, 0.2, -0.2], 
	1, 1.275,	1, 0.2, 
	[0, 0.2,0], 
	[[1,1,1, _intensity], [1,1,1, 0.01], [1,1,1, 0]], 
	[1000], 
	1, 
	0.04, 
	"", 
	"", 
	_source];
	_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
	_fog setDropInterval 0.001;

_source attachto [_unit,[0,0.15,0], "neck"]; // get fog to come out of player mouth

sleep 0.5; // 1/2 second exhalation
deletevehicle _source;
};
};