// parameter format, array of:
// output item, array of input items and how many of each item. Treat each input item as an array
// that includes the class name and the number required.
 
 
// PARAMETER STRUCTURE VERY IMPORTANT
// type = 0 for magazine, 1 for weapon/toolbelt
// [ [ type, "Finished Readable Item Name","FinishedItemClassName","FinishedQty" ] , [ [type, "RequiredClassName","RequiredQty"] , [type, "RequiredClassName2","RequiredQty"] ... ]]
 
 
sleep 1;
 
if (!show_industrial) then {
    show_industrial = true;
    _restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";
 
    manatee_craft_menu_ind = [];
    manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Scrap Metal (from tin cans)") +"</t>"),"crafting\oven.sqf",[[0,"Scrap Metal","PartGeneric",1],[[0,"TrashTinCan",6,"Empty Tin Can"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Scrap Metal (from razors)") +"</t>"),"crafting\oven.sqf",[[0,"Scrap Metal","PartGeneric",1],[[0,"ItemTrashRazor",6,"Razor"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Scrap Metal (from engine parts)") +"</t>"),"crafting\oven.sqf",[[0,"Scrap Metal","PartGeneric",2],[[0,"PartEngine",1,"Engine Parts"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Scrap Metal (from fuel tank parts)") +"</t>"),"crafting\oven.sqf",[[0,"Scrap Metal","PartGeneric",1],[[0,"PartFueltank",1,"Fuel Tank Parts"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Scrap Metal (from main rotor assembly)") +"</t>"),"crafting\oven.sqf",[[0,"Scrap Metal","PartGeneric",2],[[0,"PartVRotor",1,"Main Rotor Assembly"]]],96,false,false,"",_restriction]];
    manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Tank Trap Kit") +"</t>"),"crafting\oven.sqf",[[0,"Tank Trap Kit","ItemTankTrap",1],[[0,"PartGeneric",1,"Scrap Metal"]]],96,false,false,"",_restriction]];
    manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Wire Kit") +"</t>"),"crafting\oven.sqf",[[0,"Wire Kit","ItemWire",1],[[0,"PartGeneric",1,"Scrap Metal"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Windscreen") +"</t>"),"crafting\oven.sqf",[[0,"Windscreen","PartGlass",1],[[0,"TrashJackDaniels",4,"Empty Whiskey Bottle"]]],96,false,false,"",_restriction]];
    manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Empty Jerrycan") +"</t>"),"crafting\oven.sqf",[[0,"Empty Jerrycan","ItemJerrycanEmpty",1],[[0,"PartFueltank",1,"Fuel Tank Parts"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Engine Parts") +"</t>"),"crafting\oven.sqf",[[0,"Engine Parts","PartEngine",1],[[0,"PartGeneric",2,"Scrap Metal"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Main Rotor Assembly") +"</t>"),"crafting\oven.sqf",[[0,"Main Rotor Assembly","PartVRotor",1],[[0,"PartGeneric",2,"Scrap Metal"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Fuel Tank Parts") +"</t>"),"crafting\oven.sqf",[[0,"Fuel Tank Parts","PartFuelTank",1],[[0,"PartGeneric",1,"Scrap Metal"]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("    Car Wheel") +"</t>"),"crafting\oven.sqf",[[0,"Car Wheel","PartWheel",1],[[0,"PartGeneric",2,"Scrap Metal"]]],96,false,false,"",_restriction]];
} else {
    show_industrial = false;
    {player removeAction _x;} foreach manatee_craft_menu_ind; manatee_craft_menu_ind = [];
};