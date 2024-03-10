private ["_incombat","_timeout","_ebayrandomspawn"];

_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };

if (_inCombat) then {
	titleText ["You can't select a drop point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Dropping at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[9711.25,8962.2,1000.0], [9756.47,8715.15,1000.0], [9401.49,8953.64,1000.0], [9240.9,8802.83,1000.0], [9867.63,8751.83,1000.0]] call BIS_fnc_selectRandom;
	player setVariable["ghkcanteleport",true];
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
		titleText ["Use your Scroll Wheel to open the chute!", "PLAIN DOWN", 3];
	systemChat ('Use your Scroll Wheel to open the chute!');
	sleep 2;
	titleFadeOut 1;
	//execVM "newspawn\classes_execute.sqf";
};