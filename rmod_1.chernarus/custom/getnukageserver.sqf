private ["_pcid"];
diag_log ("getnulageserver called, player pcid:");
if (!isServer) exitWith {}; //Make sure this script runs only on server.
_pcid = owner ((_this select 0) select 0);
diag_log(_pcid);

dz_get_nuke_destruction=[nuke1detonated,nuke2detonated,nuke3detonated,nuke4detonated,nuke5detonated,nuke6detonated,nuke7detonated,nuke8detonated,nuke9detonated,time]; //cherno, elektro, berezino a, berezino b, NWAF,NEAF,CARRIER,STARY SOBOR, WEST KAMENKA
diag_log(dz_get_nuke_destruction);
_pcid publicVariableClient "dz_get_nuke_destruction"; //tell player client's machine where to generate destruction

