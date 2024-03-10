"dayzInfectedCamps"        addPublicVariableEventHandler {(_this select 1) call infectedcamps};

"dayzBloodsuckerZone"        addPublicVariableEventHandler {(_this select 1) call bloodsucker_zone};

"dayz_burn_areas"        addPublicVariableEventHandler {(_this select 1) call burn_zones};

//'ghkpacket' used to spawn client side triggers for infected camps above on clients after server is done creating them
if (isDedicated) then { 
    "ghkpacket" addPublicVariableEventHandler {
        _pcid = owner (_this select 1 select 0);
		diag_log("ghk server called for camps");
        ghkpacket = dayzInfectedCamps; //[time,dayzInfectedCamps];   //ugh just change it to the time to force it to change
        _pcid publicVariableClient "ghkpacket";
    };
} else {
    "ghkpacket" addPublicVariableEventHandler {
		diag_log("ghk client recieved camps");
		(_this select 1 ) call infectedcamps};
    
};


//'gcipacket2' used to spawn client side  for bloodsucker zone on clients after server is done creating them
if (isDedicated) then { 
    "gcipacket2" addPublicVariableEventHandler {
	//diag_log ("server responded ghk");
        _pcid = owner (_this select 1 select 0);
        gcipacket2 = dayzBloodsuckerZone;
        _pcid publicVariableClient "gcipacket2";
    };
} else {
    "gcipacket2" addPublicVariableEventHandler {
	//diag_log ("client received ghk");
	dayzBloodsuckerZone = _this select 1;
(_this select 1 ) call bloodsucker_zone};
    
};

//'gcipacket6' used to set client side 'dzn_ns_bloodsucker_den' for newly joining clients
if (isDedicated) then { 
    "gcipacket6" addPublicVariableEventHandler {
        _pcid = owner (_this select 1 select 0);
        gcipacket6 = dzn_ns_bloodsucker_den;
        _pcid publicVariableClient "gcipacket6";
    };
} else {
    "gcipacket6" addPublicVariableEventHandler {
	dzn_ns_bloodsucker_den = _this select 1;
	//(_this select 1 ) call bloodsucker_zone

};
    
};

//'gcipacket7' used to set client side 'dayz_won_the_game' for newly joining clients
if (isDedicated) then { 
    "gcipacket7" addPublicVariableEventHandler {
        _pcid = owner (_this select 1 select 0);
        gcipacket7 = dayz_won_the_game;
        _pcid publicVariableClient "gcipacket7";
    };
} else {
	
	"dayz_won_the_game" addPublicVariableEventHandler {
			
			
			if(dayz_won_the_game) then {
			
				if(player hasWeapon "Cobalt_File") then {
					player removeWeapon "Cobalt_File";
					//GHK Force the server to know:-If a lot of players have the cobalt_file, this may have a performance impact? they shouldnt!
					dayzPlayerSave = [player,dayz_Magazines,false];
					publicVariableServer "dayzPlayerSave";					
				};
				
				playSound "bl_fulllow";
				execVM "nuke\earthquake.sqf";
				//addCamShake [5, 5, 25];
				[] spawn {
					_nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.1, 0.1, 0.0], [1.0, 0.1, 0.0, 0.1],[1.0,0.1,0.0, 0.5]];
					_nonapsi_ef ppEffectCommit 6;
					_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
					_nonapsi_ef ppEffectCommit 1;
					ppEffectDestroy _nonapsi_ef;
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 16; 
					
					sleep 8;
					cutText ["The Survivors have saved the World!!!!","PLAIN"];
					playMusic "party";					
				
				};
				//kill all zombies, kill all bloodsuckers, set publicvariable to do same on clients, then wait 1/2 an hour and set dayz_won_the_game = false
				{
				
				if((agent _x) isKindOf "zZombie_Base") then {
					agent _x setDamage 1;
					
					};
					
				} 
				forEach agents;
				
				{
					if ((Alive _x)) then 
					{
						if ((vehicle _x) == _x) then 
						{
							//bloodsuckers
							if((_x isKindOf "ns_bloodsucker")) then {
				
								_x setDamage 1;
							};
						
						};
					};

				} forEach allUnits;
			};

	};
	
    "gcipacket7" addPublicVariableEventHandler {
		dayz_won_the_game = _this select 1;
			
			if(dayz_won_the_game) then {
			
				if(player hasWeapon "Cobalt_File") then {
					player removeWeapon "Cobalt_File";
					//GHK Force the server to know:-If a lot of players have the cobalt_file, this may have a performance impact? they shouldnt!
					dayzPlayerSave = [player,dayz_Magazines,false];
					publicVariableServer "dayzPlayerSave";					
				};
				
				playSound "bl_fulllow";
				execVM "nuke\earthquake.sqf";
				//addCamShake [5, 5, 25];
				[] spawn {
					_nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.1, 0.1, 0.0], [1.0, 0.1, 0.0, 0.1],[1.0,0.1,0.0, 0.5]];
					_nonapsi_ef ppEffectCommit 6;
					_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
					_nonapsi_ef ppEffectCommit 1;
					ppEffectDestroy _nonapsi_ef;
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 16; 
				
				};

				//kill all zombies, kill all bloodsuckers, set publicvariable to do same on clients, then wait 1/2 an hour and set dayz_won_the_game = false
				{
				
				if((agent _x) isKindOf "zZombie_Base") then {
					agent _x setDamage 1;
					
					};
					
				} 
				forEach agents;
				
				{
					if ((Alive _x)) then 
					{
						if ((vehicle _x) == _x) then 
						{
							//bloodsuckers
							if((_x isKindOf "ns_bloodsucker")) then {
							
								_x setDamage 1;
							};
						
						};
					};

				} forEach allUnits;
				//systemChat "The survivors have saved the world! The PSI Emissions have dissipated! The monsters are gone!"
				//cutText ["The survivors have saved the world! The PSI Emissions have dissipated! The monsters are gone!","PLAIN DOWN"];
			}else{
				//cutText ["The survivors have saved the world! The PSI Emissions have dissipated! The monsters are gone!","PLAIN DOWN"];
			};

	};
    
};


//'gcipacket4' used to spawn client side  for bloodsucker zone on clients after server is done creating them
if (isDedicated) then { 
    "gcipacket4" addPublicVariableEventHandler {
        _pcid = owner (_this select 1 select 0);
		//diag_log ("ghk server, client called dz_bloodsucker_count: " + str(dz_bloodsucker_count));
        gcipacket4 = dz_bloodsucker_count;
        _pcid publicVariableClient "gcipacket4";
    };
} else {
    "gcipacket4" addPublicVariableEventHandler {
	//diag_log ("ghk client, server replied dz_bloodsucker_count PRE: " + str(_this));
	dz_bloodsucker_count = _this select 1;
	//diag_log ("ghk client, server replied dz_bloodsucker_count POST: " + str(dz_bloodsucker_count));
//(_this select 1 ) call bloodsucker_count

	};

};

//'gcipacket5' used to spawn client side  for burn zones on clients after server is done creating them
if (isDedicated) then { 
    "gcipacket5" addPublicVariableEventHandler {
	//diag_log ("ghk server, client asked dayz_burn_areas PRE: " + str(dayz_burn_areas));
        _pcid = owner (_this select 1 select 0);
        gcipacket5 = dayz_burn_areas; //[time,dayzInfectedCamps];   //ugh just change it to the time to force it to change
		//diag_log ("ghk server, client asked dayz_burn_areas gcipacket5 POST: " + str(gcipacket5));
        _pcid publicVariableClient "gcipacket5";
    };
} else {
    "gcipacket5" addPublicVariableEventHandler {
	//diag_log ("ghk client, server replied dayz_burn_areas: " + str(_this));
		(_this select 1 ) call burn_zones};
    
};

"dayzFire2"			addPublicVariableEventHandler {
nul=(_this select 1) spawn BIS_Effects_Burn;
_ghkpos = ASLtoATL getPosASL ((_this select 1) select 0);
createSoundSource ["Sound_Fire", _ghkpos, [], 0];
};
 
 
