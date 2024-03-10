
private["_wasDogOwner","_isDogOwner","_returnval"];
diag_log "GHK remove dog";
//player setVariable["ghkcanteleport",true];

_isDogOwner=player getVariable ["dogID", 0];
_wasDogOwner = player getVariable ["hadDog", 0];
if (_isDogOwner>0||_wasDogOwner>0) then {
	diag_log "GHK dog found";
	player setVariable ["dogSwitch",1]; //ghk tell the game (tame_dog.sqf & tame_dog_switch.sqf) that the dog died due to play switching costume and dont remove dogtags.
 if(!("CDF_dogtags" in Weapons player)) then {
	player AddWeapon "CDF_dogtags"; //used for summoning dog if still alive
	//GHK Force the server to know:-
	//_magazinesplayer	= call player_countmagazines; //magazines player;
			dayzPlayerSave = [player,dayz_Magazines,false];
			publicVariableServer "dayzPlayerSave";		
  };
  
  	{
		if((_x isKindOf "Pastor")||(_x isKindOf "Fin")) then {
	
			if(_x getVariable ["CharacterID","0"] == player getVariable ["characterID", "0"]) then {
				_x setdamage 1;
				deleteVehicle _x;
				diag_log "GHK dog removed";
			
			};
			
		};
			
	

	} forEach allUnits;
	
	cutText ["To get your dog back, please log out and log back in. Then use the scroll wheel to whistle for your dog.", "PLAIN DOWN"];

	systemChat "To get your dog back, please log out and log back in. Then use the scroll wheel to whistle for your dog.";

  
  _returnval=false;

}else{
_returnval=true;
};
_returnval



