
ghkpacket = [player,time]; 
publicVariableServer "ghkpacket"; //dummy variable to force server to give the client it's dayz_infectedcamps value on initialization.

gcipacket4 = [player,time]; 
publicVariableServer "gcipacket4"; //'dummy' variable to force server to give the client it's dz_bloodsucker_count value on initialization.

gcipacket5 = [player,time]; 
publicVariableServer "gcipacket5"; //'dummy' variable to force server to give the client it's dayz_burn_areas value on initialization.

gcipacket6 = [player,time]; 
publicVariableServer "gcipacket6"; //'dummy' variable to force server to give the client it's dzn_ns_bloodsucker_den value on initialization.

gcipacket7 = [player,time]; 
publicVariableServer "gcipacket7"; //'dummy' variable to force server to give the client it's dayz_won_the_game value on initialization.

waitUntil {!isNil ("dayz_Totalzedscheck")}; //need this pause for the next part to work properly
gcipacket2 = [player,time]; 
publicVariableServer "gcipacket2"; //'dummy' variable to force server to give the client it's dayzBloodsuckerZone value on initialization.