"ghkbszone" SetMarkerPos [dayzBloodsuckerZone select 0 , dayzBloodsuckerZone select 1 , 0]; //set this on client to be safe, will be synced with server
//diag_log format["CLIENT: GHK Bloodsucker Zone is: " + str(GetMarkerPos "ghkbszone")];
private["_blood_sound","_sound","_meters"];
_meters = player distance GetMarkerPos "ghkbszone";
	if((!dayz_won_the_game)&&(_meters <= 2800) ) then { //check if the player is within the new bloodsucker zone, and give them a fright!
	//diag_log format["CLIENT: GHK Bloodsucker Zone playing sound: "];
		_blood_sound = 1;
		_blood_sound = round(random 3);
		
		//diag_log format["CLIENT: GHK Bloodsucker Zone playing sound: " + str(_blood_sound)];
		switch (_blood_sound) do {
			case 0: {_sound = "blood_distant_growl_4";};
			case 1: {_sound = "blood_distant_growl_4";};
			case 2: {_sound = "blood_distant_growl_4";};
			case 3: {_sound = "blood_distant_growl_4";};
			default   {_sound = "blood_distant_growl_4";};
		};
		playSound _sound;
		systemChat "You hear growls in the distance.";
	};
	
