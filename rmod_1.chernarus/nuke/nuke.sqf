//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// EDITED VERSION OF THE ARMA2 ORIGINAL SCRIPT
// ARMED-ASSAULT.DE
// 06.11.2013
//////////////////////////////////////////////////////////////

//*******************************************************************
private["_nukepos","_Cone","_top","_top2","_smoke","_Wave","_light"];
_nukepos = (_this select 0); 
switch (_nukepos) do {
    case 1: { nukepos = nukepos1; nuke1detonated = true;
		areaee1 = createMarkerLocal ["areaee1", position nukepos];
		"areaee1" setMarkerShapeLocal "ELLIPSE";
		"areaee1" setMarkerSizeLocal [1000, 1000];
		"areaee1" setMarkerColorLocal "ColorRed";

		_markerobjareaee1 = createMarkerLocal ["natext1", position nukepos];
		_markerobjareaee1 setMarkerShapeLocal "ICON";
		_markerobjareaee1 setMarkerTypeLocal "Vehicle";
		_markerobjareaee1 setMarkerColorLocal "ColorRed";
		_markerobjareaee1 setMarkerTextLocal "Nuclear Blast Zone";
	
	};
    case 2: { nukepos = nukepos2; nuke2detonated = true; 
		areaee2 = createMarkerLocal ["areaee2", position nukepos];
		"areaee2" setMarkerShapeLocal "ELLIPSE";
		"areaee2" setMarkerSizeLocal [1000, 1000];
		"areaee2" setMarkerColorLocal "ColorRed";

		_markerobjareaee2 = createMarkerLocal ["natext2", position nukepos];
		_markerobjareaee2 setMarkerShapeLocal "ICON";
		_markerobjareaee2 setMarkerTypeLocal "Vehicle";
		_markerobjareaee2 setMarkerColorLocal "ColorRed";
		_markerobjareaee2 setMarkerTextLocal "Nuclear Blast Zone";
	
	
	};
	case 3: { nukepos = nukepos3; nuke3detonated = true; 
		areaee3 = createMarkerLocal ["areaee3", position nukepos];
		"areaee3" setMarkerShapeLocal "ELLIPSE";
		"areaee3" setMarkerSizeLocal [1000, 1000];
		"areaee3" setMarkerColorLocal "ColorRed";

		_markerobjareaee3 = createMarkerLocal ["natext3", position nukepos];
		_markerobjareaee3 setMarkerShapeLocal "ICON";
		_markerobjareaee3 setMarkerTypeLocal "Vehicle";
		_markerobjareaee3 setMarkerColorLocal "ColorRed";
		_markerobjareaee3 setMarkerTextLocal "Nuclear Blast Zone";	
	
	};
    case 4: { nukepos = nukepos4; nuke4detonated = true; 
		areaee4 = createMarkerLocal ["areaee4", position nukepos];
		"areaee4" setMarkerShapeLocal "ELLIPSE";
		"areaee4" setMarkerSizeLocal [1000, 1000];
		"areaee4" setMarkerColorLocal "ColorRed";

		_markerobjareaee4 = createMarkerLocal ["natext4", position nukepos];
		_markerobjareaee4 setMarkerShapeLocal "ICON";
		_markerobjareaee4 setMarkerTypeLocal "Vehicle";
		_markerobjareaee4 setMarkerColorLocal "ColorRed";
		_markerobjareaee4 setMarkerTextLocal "Nuclear Blast Zone";	
	
	};
	case 5: { nukepos = nukepos5; nuke5detonated = true;
		areaee5 = createMarkerLocal ["areaee5", position nukepos];
		"areaee5" setMarkerShapeLocal "ELLIPSE";
		"areaee5" setMarkerSizeLocal [1000, 1000];
		"areaee5" setMarkerColorLocal "ColorRed";

		_markerobjareaee5 = createMarkerLocal ["natext5", position nukepos];
		_markerobjareaee5 setMarkerShapeLocal "ICON";
		_markerobjareaee5 setMarkerTypeLocal "Vehicle";
		_markerobjareaee5 setMarkerColorLocal "ColorRed";
		_markerobjareaee5 setMarkerTextLocal "Nuclear Blast Zone";	
	
	};
    case 6: { nukepos = nukepos6; nuke6detonated = true; 
		areaee6 = createMarkerLocal ["areaee6", position nukepos];
		"areaee6" setMarkerShapeLocal "ELLIPSE";
		"areaee6" setMarkerSizeLocal [1000, 1000];
		"areaee6" setMarkerColorLocal "ColorRed";

		_markerobjareaee6 = createMarkerLocal ["natext6", position nukepos];
		_markerobjareaee6 setMarkerShapeLocal "ICON";
		_markerobjareaee6 setMarkerTypeLocal "Vehicle";
		_markerobjareaee6 setMarkerColorLocal "ColorRed";
		_markerobjareaee6 setMarkerTextLocal "Nuclear Blast Zone";
	
	};
	case 7: { nukepos = nukepos7; nuke7detonated = true; 
		areaee7 = createMarkerLocal ["areaee7", position nukepos];
		"areaee7" setMarkerShapeLocal "ELLIPSE";
		"areaee7" setMarkerSizeLocal [1000, 1000];
		"areaee7" setMarkerColorLocal "ColorRed";

		_markerobjareaee7 = createMarkerLocal ["natext7", position nukepos];
		_markerobjareaee7 setMarkerShapeLocal "ICON";
		_markerobjareaee7 setMarkerTypeLocal "Vehicle";
		_markerobjareaee7 setMarkerColorLocal "ColorRed";
		_markerobjareaee7 setMarkerTextLocal "Nuclear Blast Zone";	
	
	};
    case 8: { nukepos = nukepos8; nuke8detonated = true; 
		areaee8 = createMarkerLocal ["areaee8", position nukepos];
		"areaee8" setMarkerShapeLocal "ELLIPSE";
		"areaee8" setMarkerSizeLocal [1000, 1000];
		"areaee8" setMarkerColorLocal "ColorRed";

		_markerobjareaee8 = createMarkerLocal ["natext8", position nukepos];
		_markerobjareaee8 setMarkerShapeLocal "ICON";
		_markerobjareaee8 setMarkerTypeLocal "Vehicle";
		_markerobjareaee8 setMarkerColorLocal "ColorRed";
		_markerobjareaee8 setMarkerTextLocal "Nuclear Blast Zone";
	
	};
	case 9: { nukepos = nukepos9; nuke9detonated = true; 
		areaee9 = createMarkerLocal ["areaee9", position nukepos];
		"areaee9" setMarkerShapeLocal "ELLIPSE";
		"areaee9" setMarkerSizeLocal [1000, 1000];
		"areaee9" setMarkerColorLocal "ColorRed";

		_markerobjareaee9 = createMarkerLocal ["natext9", position nukepos];
		_markerobjareaee9 setMarkerShapeLocal "ICON";
		_markerobjareaee9 setMarkerTypeLocal "Vehicle";
		_markerobjareaee9 setMarkerColorLocal "ColorRed";
		_markerobjareaee9 setMarkerTextLocal "Nuclear Blast Zone";	
	
	
	};
};

diag_log(getPos nukepos);diag_log(nukepos);

if(isServer) then {
	diag_log('server called');
}
else{diag_log('client called');};

if(!isServer) then {
	_Cone = "#particlesource" createVehicleLocal getpos nukepos;
	_Cone setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 10, [0, 0, 0],
					[0, 0, 0], 0, 1.275, 1, 0, [40,80], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
					[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", nukepos];
	_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
	_Cone setParticleCircle [10, [-10, -10, 20]];
	_Cone setDropInterval 0.005;

	_top = "#particlesource" createVehicleLocal getpos nukepos;
	_top setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 0],
					[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", nukepos];
	_top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
	_top setDropInterval 0.002;

	_top2 = "#particlesource" createVehicleLocal getpos nukepos;
	_top2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 3, 112, 0], "", "Billboard", 1, 20, [0, 0, 0],
					[0, 0, 60], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", nukepos];
	_top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
	_top2 setDropInterval 0.002;

	_smoke = "#particlesource" createVehicleLocal getpos nukepos;
	_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
					[0, 0, 60], 0, 1.7, 1, 0, [40,15,120], 
					[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]]
					, [0.5, 0.1], 1, 1, "", "", nukepos];
	_smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
	_smoke setDropInterval 0.002;

	_Wave = "#particlesource" createVehicleLocal getpos nukepos;
	_Wave setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0],
					[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
					[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", nukepos];
	_Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
	_Wave setParticleCircle [50, [-80, -80, 2.5]];
	_Wave setDropInterval 0.0002;


	_light = "#lightpoint" createVehicleLocal [((getpos nukepos select 0)),(getpos nukepos select 1),((getpos nukepos select 2)+500)];
	_light setLightAmbient[1500, 1200, 1000];
	_light setLightColor[1500, 1200, 1000];
	_light setLightBrightness 100000.0;

	//*******************************************************************
	
	if((player distance nukepos) < 5000) then { //player needs to be within 5000m of the blast
		if (mdh_nuke_colorcorrection > 0) then
		{
			// COLORCORRECTION
			execVM "nuke\colorcorrection.sqf";
		}
		else
		{
			// FLASH
			execVM "nuke\flash.sqf";
		};

		// EARTHQUAKE
		execVM "nuke\earthquake.sqf";

		// ASH
		execVM "nuke\ash.sqf";
	};

};
//if(isServer) then { //let server do the damage. Saves network if server and clients doing the deletion?
	// NUKE DESTRUCTION ZONE, USE ZERO/0 AS PARAMETER TO DEACTIVATE DESTRUCTION
	call compile preprocessfilelinenumbers "nuke\nuke_damage.sqf";
//};
if(!isServer) then {
	_Wave setDropInterval 0.001;
	deletevehicle _top;
	deletevehicle _top2;

	sleep 4.5;

	_i = 0;
	while {_i < 100} do
	{
		_light setLightBrightness 100.0 - _i;
		_i = _i + 1;
		sleep 0.1;
	};
	deleteVehicle _light;

	sleep 2;

	_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
					[0, 0, 45], 0, 1.7, 1, 0, [40,25,80], 
					[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
					, [0.5, 0.1], 1, 1, "", "", nukepos];

	_Cone setDropInterval 0.01;
	_smoke setDropInterval 0.006;
	_Wave setDropInterval 0.001;

	sleep 2;

	_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
					[0, 0, 30], 0, 1.7, 1, 0, [40,25,80], 
					[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
					, [0.5, 0.1], 1, 1, "", "", nukepos];
	_smoke setDropInterval 0.012;
	_Cone setDropInterval 0.02;
	_Wave setDropInterval 0.01;

	sleep 15;
	deleteVehicle _Wave;
	deleteVehicle _cone;
	deleteVehicle _smoke;
};