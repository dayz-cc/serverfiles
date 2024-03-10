//===================piXel 15-02-2013===========
private ["_anomaly","_trg","_light","_spark","_dust","_static"];
_anomalypos = _this select 0;

if (isServer) exitwith {diag_log("GHK Server got called!");};

_anomaly = "Land_psi_bouda" createVehicleLocal _anomalypos;
_anomaly say ["bl_wave3",80];
if ((getPosATL _anomaly select 2) >= - 1) then
{
_anomaly setPosATL [getPosATL _anomaly select 0,getPosATL _anomaly select 1, - 2.5];
};


_classname = "#lightpoint";
_location = getPosATL _anomaly;
_object = _classname createVehicleLocal _location;
_light = _object;
_light setLightBrightness 0.05;
_light setLightColor[0.4,0.6,1];
_light lightAttachObject [_anomaly, [0,0,3]];
_object = "";
_classname = "";
sleep 1;

_classname = "#particlesource";
_object = _classname createVehicleLocal _location;
_spark = _object;
_spark setParticleParams  [["ca\data\blesk2.p3d", 1, 0, 1],"",
"spaceObject",
1,
0.2,
[0,0,3],
[0,0,0],
15,0.3,0.2,0,
[0.02,0.02,0.02,0],
[[1,1,1,0.5],[1,1,1,0.5]],
[1.5,0.5],
0.1,
0.8,
"",
"",
_anomaly];
_spark setDropInterval 0.1;
_object = "";
sleep 1;

_object = _classname createVehicleLocal _location;
_dust = _object;
_dust setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 48], "",
"Billboard",
5,
3,
[0, 0, 0.4],
[0, 0, 0],
1,1.4,1,1,
[9],
[[0.9, 0.9, 0.9 ,0.0],
[0.9, 0.8, 0.5, 0.4],[0.8, 0.8, 0.8, 0.0]],
[0.01],
1,
0,
"",
"",
_anomaly];
_dust setDropInterval 0.1;
_dust setParticleRandom [0, [3, 3, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
_dust setParticleCircle [0, [0, 0, 0]];

_object = _classname createVehicleLocal _location;
_dust2 = _object;
_dust2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 48], "",
"Billboard",
5,
3,
[0, 0, 0.4],
[0, 0, 0],
1,1.4,1,1,
[9],
[[0.9, 0.9, 0.9 ,0.0],
[0.9, 0.8, 0.5, 0.4],[0.8, 0.8, 0.8, 0.0]],
[0.01],
1,
0,
"",
"",
_anomaly];
_dust2 setDropInterval 0.1;
_dust2 setParticleRandom [0, [6, 6, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
_dust2 setParticleCircle [3, [0, 0, 0]];

_object = _classname createVehicleLocal _location;
_dust3 = _object;
_dust3 setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 48], "",
"Billboard",
5,
3,
[0, 0, 0.4],
[0, 0, 0],
1,1.4,1,1,
[9],
[[0.9, 0.9, 0.9 ,0.0],
[0.9, 0.8, 0.5, 0.4],[0.8, 0.8, 0.8, 0.0]],
[0.01],
1,
0,
"",
"",
_anomaly];
_dust3 setDropInterval 0.1;
_dust3 setParticleRandom [0, [6, 6, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
_dust3 setParticleCircle [0, [0, 0, 0]];

_object = _classname createVehicleLocal _location;
_dust4 = _object;
_dust4 setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 48], "",
"Billboard",
5,
3,
[0, 0, 0.4],
[0, 0, 0],
1,1.4,1,1,
[9],
[[0.9, 0.9, 0.9 ,0.0],
[0.9, 0.8, 0.5, 0.4],[0.8, 0.8, 0.8, 0.0]],
[0.01],
1,
0,
"",
"",
_anomaly];
_dust4 setDropInterval 0.1;
_dust4 setParticleRandom [0, [3, 3, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
_dust4 setParticleCircle [6, [0, 0, 0]];
Sleep 7; //GHK sleep the maximum duration of zombie horde spawning... around 7 seconds. though the horde may spawn in just 1 to 7 seconds.
deleteVehicle _dust;deleteVehicle _dust2;deleteVehicle _dust3;deleteVehicle _dust4;

deleteVehicle _spark;deleteVehicle _light;deleteVehicle _anomaly;