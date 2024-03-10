{
    player removeAction _x
} forEach manatee_craft_menu;
manatee_craft_menu = [];
crafting_menu_open = true;
show_industrial = false;
show_survival = false;
show_weapons = false;
 
sleep 1;
cutText ["Opened Crafting Menu. Scroll your mouse to access it.","PLAIN",2];
sleep 1;
_restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";
 
manatee_craft_menu = [];
manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#0074E8"">" + ("Crafting Menu") +"</t>"),"","",99,false,false,"",_restriction]];
manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#FF7300"">" + (" Close Menu") +"</t>"),"crafting\closemenu.sqf","",98,false,true,"",_restriction]];
manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#4AC925"">" + ("  Industrial Parts") +"</t>"),"crafting\industrial.sqf","",97,false,false,"",_restriction]];
manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#4AC925"">" + ("  Survival Gear") +"</t>"),"crafting\survival.sqf","",95,false,false,"",_restriction]];
manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#4AC925"">" + ("  Weapons Crafting") +"</t>"),"crafting\weapons.sqf","",93,false,false,"",_restriction]];
manatee_craft_menu set [count manatee_craft_menu, player addaction [("<t color=""#0074E8"">" + ("-----------------------------") +"</t>"),"","",91,false,false,"",_restriction]];