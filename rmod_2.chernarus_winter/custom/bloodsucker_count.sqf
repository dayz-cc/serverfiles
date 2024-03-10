//"ghkbszone" SetMarkerPos [dayzBloodsuckerZone select 0 , dayzBloodsuckerZone select 1 , 0];
//diag_log format["CLIENT: GHK Bloodsucker server COUNT is: " + str(this select 0)];
//diag_log ("ghk client, server replied dz_bloodsucker_count POST 2: " + str(_this select 0));
dz_bloodsucker_count = _this select 0; //set the client variable from server

//diag_log format["CLIENT: GHK dz_bloodsucker_count is: " + str(dz_bloodsucker_count)];
