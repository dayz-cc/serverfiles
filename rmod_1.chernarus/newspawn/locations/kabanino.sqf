private ["_incombat","_timeout","_ebayrandomspawn"];

_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };

if (_inCombat) then {
	titleText ["You can't select a drop point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Dropping at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[5300.83,8547.84,1000.0], [5216.97,8646.67,1000.0], [5294.96,8437.37,1000.0], [5194.68,8584.59,1000.0], [5794.95,8698.89,1000.0]] call BIS_fnc_selectRandom;
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