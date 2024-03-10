// parameter format, array of:
// output item, array of input items and how many of each item. Treat each input item as an array
// that includes the class name and the number required.
 
 
// PARAMETER STRUCTURE VERY IMPORTANT
// type = 0 for magazine, 1 for weapon/toolbelt
// [ [ type, "Finished Readable Item Name","FinishedItemClassName","FinishedQty" ] , [ [type, "RequiredClassName","RequiredQty"] , [type, "RequiredClassName2","RequiredQty"] ... ]]
 
 
sleep 1;
 
if (!show_survival) then {
    show_survival = true;
    _restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";
    manatee_craft_menu_sur = [];
    manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Bandage") +"</t>"),"crafting\oven.sqf",[[0,"Bandage","ItemBandage",1],[[0,"ItemTrashToiletpaper",2,"Toilet Paper"]]],94,false,false,"",_restriction]];
   manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Splint (Morphine)") +"</t>"),"crafting\oven.sqf",[[0,"Splint (Morphine)","ItemMorphine",1],[[0,"ItemBandage",2,"Bandage"],[0,"PartWoodPile",1,"Wood Pile"]]],94,false,false,"",_restriction]];
    manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Hatchet") +"</t>"),"crafting\oven.sqf",[[1,"Hatchet","ItemHatchet",1],[[0,"ItemTrashRazor",2,"Razor"],[0,"PartWoodPile",1,"Wood Pile"]]],94,false,false,"",_restriction]];
    manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Box of Matches") +"</t>"),"crafting\oven.sqf",[[1,"Box of Matches","ItemMatchbox",1],[[0,"ItemBandage",3,"Bandage"],[0,"HandRoadFlare",1,"Road Flare"]]],94,false,false,"",_restriction]];
	
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Entrenching Tool (for creating and removing a stash spot from a fireplace)") +"</t>"),"crafting\oven.sqf",[[1,"Entrenching Tool","ItemEtool",1],[[0,"PartGeneric",1,"Scrap Metal"]]],94,false,false,"",_restriction]];
    
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Zombie Bait Bomb (Sandbag) (from Hand Grenade)") +"</t>"),"crafting\oven.sqf",[[0,"Zombie Bait Siren (Sandbag)","Sandbag",1],[[0,"PartsGeneric",1,"Scrap Metal"],[0,"HandGrenade_West",1,"Grenade"]]],94,false,false,"",_restriction]];
	
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Zombie Bait Bomb (Sandbag) (from M203 HE Grenade)") +"</t>"),"crafting\oven.sqf",[[0,"Zombie Bait Siren (Sandbag)","Sandbag",1],[[0,"PartsGeneric",1,"Scrap Metal"],[0,"1Rnd_HE_M203",1,"M203 HE Grenade"]]],94,false,false,"",_restriction]];
	
   manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Hunting Knife") +"</t>"),"crafting\oven.sqf",[[1,"Hunting Knife","ItemKnife",1],[[0,"ItemTrashRazor",4,"Razor"]]],94,false,false,"",_restriction]];
    //manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Hunting Knife (from Military Flashlight)") +"</t>"),"crafting\oven.sqf",[[1,"Hunting //Knife","ItemKnife",1],[[0,"ItemTrashRazor",3,"Razor"],[1,"ItemFlashlightRed",1,"Flashlight (Military)"]]],94,false,false,"",_restriction]];
    
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Old Camping Tent (from Ghillie Suit)") +"</t>"),"crafting\oven.sqf",[[0,"Old Camping Tent","ItemTent",1],[[0,"ItemTankTrap",1,"Tank Trap Kit"],[0,"ItemWire",1,"Wire Kit"],[0,"Skin_Sniper1_DZ",1,"Ghillie Suit"]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Old Camping Tent (from Camo Clothing)") +"</t>"),"crafting\oven.sqf",[[0,"Old Camping Tent","ItemTent",1],[[0,"ItemTankTrap",1,"Tank Trap Kit"],[0,"ItemWire",1,"Wire Kit"],[0,"Skin_Camo1_DZ",1,"Camo Clothing"]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Old Camping Tent (from Soldier Clothing)") +"</t>"),"crafting\oven.sqf",[[0,"Old Camping Tent","ItemTent",1],[[0,"ItemTankTrap",1,"Tank Trap Kit"],[0,"ItemWire",1,"Wire Kit"],[0,"Skin_Soldier1_DZ",1,"Soldier Clothing"]]],94,false,false,"",_restriction]];
	
		manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Heat pack (from Road Flares)") +"</t>"),"crafting\oven.sqf",[[0,"Heat Pack","ItemHeatPack",1],[[0,"HandRoadFlare",1,"Road Flares"],[0,"ItemBandage",1,"Bandage"]]],94,false,false,"",_restriction]];
    
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Heat pack (from Blue Chemlights)") +"</t>"),"crafting\oven.sqf",[[0,"Heat Pack","ItemHeatPack",1],[[0,"HandChemBlue",1,"Blue Chemlights"],[0,"ItemBandage",1,"Bandage"]]],94,false,false,"",_restriction]];
    manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Heat pack (from Red Chemlights)") +"</t>"),"crafting\oven.sqf",[[0,"Heat Pack","ItemHeatPack",1],[[0,"HandChemRed",1,"Red Chemlights"],[0,"ItemBandage",1,"Bandage"]]],94,false,false,"",_restriction]];
    manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("    Heat pack (from Green Chemlights)") +"</t>"),"crafting\oven.sqf",[[0,"Heat Pack","ItemHeatPack",1],[[0,"HandChemGreen",1,"Green Chemlights"],[0,"ItemBandage",1,"Bandage"]]],94,false,false,"",_restriction]];

	} else {
    show_survival = false;
    {player removeAction _x;} foreach manatee_craft_menu_sur; manatee_craft_menu_sur = [];
};