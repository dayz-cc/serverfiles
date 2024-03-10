// parameter format, array of:
// output item, array of input items and how many of each item. Treat each input item as an array
// that includes the class name and the number required.
 
 
// PARAMETER STRUCTURE VERY IMPORTANT
// type = 0 for magazine, 1 for weapon/toolbelt
// [ [ type, "Finished Readable Item Name","FinishedItemClassName","FinishedQty" ] , [ [type, "RequiredClassName","RequiredQty"] , [type, "RequiredClassName2","RequiredQty"] ... ]]
 
sleep 1;
 
if (!show_weapons) then {
    show_weapons = true;
    _restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";
 
    manatee_craft_menu_wea = [];
    manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    Satchel Charge") +"</t>"),"crafting\oven.sqf",[[0,"Satchel Charge","PipeBomb",1],[[0,"1Rnd_HE_M203",3,"M203 HE Grenade"],[0,"HandGrenade_West",3,"Grenade"]]],92,false,false,"",_restriction]];
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    Explosive Booby Trap Kit (Bear Trap) (from Hand Grenade)") +"</t>"),"crafting\oven.sqf",[[0,"Explosive Booby Trap Kit (Bear Trap)","TrapBear",1],[[0,"ItemWire",1,"Wire Kit"],[0,"HandGrenade_West",1,"Grenade"]]],92,false,false,"",_restriction]];
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    Explosive Booby Trap Kit (Bear Trap) (from M203 HE Grenade)") +"</t>"),"crafting\oven.sqf",[[0,"Explosive Booby Trap Kit (Bear Trap)","TrapBear",1],[[0,"ItemWire",1,"Wire Kit"],[0,"1Rnd_HE_M203",1,"M203 HE Grenade"]]],92,false,false,"",_restriction]];
      manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    Machete") +"</t>"),"crafting\oven.sqf",[[1,"Machete","ItemMachete",1],[[0,"PartGeneric",1,"Scrap Metal"]]],92,false,false,"",_restriction]];
	   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    Crowbar") +"</t>"),"crafting\oven.sqf",[[1,"Crowbar","ItemCrowbar",1],[[0,"PartGeneric",1,"Scrap Metal"]]],92,false,false,"",_restriction]];      
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    CZ 550 Hunting Rifle (from Lee Enfield)") +"</t>"),"crafting\oven.sqf",[[1,"CZ 550 Hunting Rifle","huntingrifle",1],[[1,"LeeEnfield",1,"Lee Enfield"],[0,"PartGlass",1,"Windscreen Glass"]]],92,false,false,"",_restriction]];
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    CZ 550 Hunting Rifle (from Winchester 1866)") +"</t>"),"crafting\oven.sqf",[[1,"CZ 550 Hunting Rifle","huntingrifle",1],[[1,"Winchester1866",1,"Winchester 1866"],[0,"PartGlass",1,"Windscreen Glass"]]],92,false,false,"",_restriction]];
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    CZ 550 Ammo (from Lee Enfield Mags)") +"</t>"),"crafting\oven.sqf",[[0,"CZ 550 Magazine","5x_22_LR_17_HMR",1],[[0,"10x_303",1,"Lee Enfield Mag."]]],92,false,false,"",_restriction]];
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    CZ 550 Ammo (from Winchester 1866 Pellets)") +"</t>"),"crafting\oven.sqf",[[0,"CZ 550 Magazine","5x_22_LR_17_HMR",1],[[0,"15Rnd_W1866_Slug",1,"15Rnd. 1866 Pellets"]]],92,false,false,"",_restriction]];
   manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("    Remington 870 (from Double-barreled Shotgun)") +"</t>"),"crafting\oven.sqf",[[1,"Remington 870","Remington870_lamp",1],[[1,"MR43",1,"Double-barreled Shotgun"],[0,"PartGlass",1,"Windscreen Glass"]]],92,false,false,"",_restriction]];
   
} else {
    show_weapons = false;
    {player removeAction _x;} foreach manatee_craft_menu_wea; manatee_craft_menu_wea = [];
};