//s_player_selfbloodbag = -1;
//s_player_tamedog = -1;
//s_player_doggy = -1; 
//s_player_movedog2 = -1;
dz_max_globalbloodsuckers = 50; //GHK, needed here?
dz_bloodsucker_count = 0;
//init global arays for Optional MissionConfig Loot Chances
call compile preprocessFileLineNumbers "custom\loot_init.sqf";

//GHK Support for namalsk winter models
AllPlayers = ["Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","CamoWinter_DZN","CamoWinterW_DZN","Sniper1W_DZN"];
AllPlayersVehicles = ["Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","CamoWinter_DZN","CamoWinterW_DZN","Sniper1W_DZN","AllVehicles"];

//Player self-action handles
dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_packtent = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_grabflare = 	-1;
	s_player_removeflare = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_flipveh = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_selfbloodbag = -1;
	s_player_tamedog = -1;
	s_player_doggy = -1; 
	s_player_movedog2 = -1;
	s_player_feeddog2 = -1;
	s_player_makeBomb = -1;
	s_player_removeBomb = -1;
	s_player_smeltItems = -1;
	s_player_firestash = -1;
	s_player_firestashout = -1;
	
};
call dayz_resetSelfActions;
