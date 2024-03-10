//===================piXel 12-02-2013============
if (isServer) exitwith {};
private ["_building","_entrance","_trg"];
_building = _this select 0;
_entrance = [getPosATL _building select 0,(getPosATL _building select 1)+2,getPosATL _building select 2];

_trg = createTrigger ["emptyDetector", _entrance];
_trg setTriggerArea [1,1,0, false];
_trg setTriggerTimeout [0,0,0, false];
_trg setTriggerActivation ["any", "present", true];
_trg setTriggerStatements ["(isplayer (thisList select 0)) && (local (thisList select 0))",
"cutText ['','black'];
nul = [(thisList select 0),'in']execVM 'addin\teleport.sqf';
cutText ['','black in', 5];",
""];

private ["_anomaly","_trg","_light","_spark","_dust","_static"];
_anomaly = _this select 0;

if ((getPosATL _anomaly select 2) >= - 1) then
{
_anomaly setPosATL [getPosATL _anomaly select 0,getPosATL _anomaly select 1, - 2.5];
};

_classname = "#lightpoint";
_location = getPosATL _anomaly;
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_light = _object;
_light setLightBrightness 0.05;
_light setLightColor[0.4,0.6,1];
_light lightAttachObject [_anomaly, [0,0,3]];
_object = "";
_classname = "";
sleep 1;

_classname = "#particlesource";
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
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

_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
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

_static = createSoundSource ["Sound_Factory09", getPosATL _dust, [], 0];