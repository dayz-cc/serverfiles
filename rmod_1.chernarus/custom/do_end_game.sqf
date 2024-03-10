sleep dayz_world_saved_timeout; //SAVED THE WORLD FOR 1/2 AN HOUR, NOW GO BACK TO REGULAR PLAY
dayz_won_the_game=false;
publicVariable "dayz_won_the_game";
[nil, nil, rEXECVM, "custom\radiomessage.sqf","The survivors saved the world... GREAT!... Now lets get back to some DayZ!"] call RE;
[nil,nil,rTitleText,"The survivors saved the world... GREAT!... Now lets get back to some DayZ!", "PLAIN",6] call RE;
[nil, nil, rPLAYSOUND, "bl_fulllow"] call RE;