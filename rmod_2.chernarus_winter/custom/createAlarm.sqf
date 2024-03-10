private ["_bombOwnerUID","_bombPos","_bombDir","_spawnStash","_bombTrigger","_objectUID","_activationstatment"];
if (!isServer) exitWith {}; //Make sure this script runs only on server.
 
_bombOwnerUID = (_this select 0) select 0;      //diag_log format ["Bomb owner's UID is %1",_bombOwnerUID];
_bombPos = (_this select 0) select 1;          //diag_log format ["Bomb's position is %1",_bombPos];
_bombDir = (_this select 0) select 2; 
_pcid = owner ((_this select 0) select 3);

_player = (_this select 0) select 3;

dz_alarm_message = "You have placed a zombie bait siren.";
_pcid publicVariableClient "dz_alarm_message"; //tell player client's machine that it is made
DZ_boobyAlarm = nil;

[_bombPos,_pcid] spawn {
	diag_log("ghk spawn alarm:");diag_log(_this select 0);
	_alarm = createSoundSource ["Sound_Alarm", (_this select 0), [], 0]; //starts alarm
	sleep 10; //20 seconds on the client?
	dz_alarm_message2 = "Your zombie bait is gone.";
	(_this select 1) publicVariableClient "dz_alarm_message2"; //tell player client's machine that it is gone

};
