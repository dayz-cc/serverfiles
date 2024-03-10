private["_positions","_ghkpos","_nearbyCount","_fireSize"];
  if (!isDedicated) then {

  
  _positions = _this select 0;
  {

	  _nearby = nearestObjects [_x ,[] ,500];
		_nearbyCount = count _nearby;

			{
				if((_x getVariable ["addfire",false])&&!(_x getVariable ["didfire",false])) then {
				/*
					switch (typeOf _x) do {
						case ("Mass_grave"): { _fireSize=(floor(random(1))+3); }; //3-4
						case ("Misc_TyreHeapEP1"): { _fireSize=(floor(random(1))+7); }; //7-8
						case ("Land_Misc_Rubble_EP1"): { _fireSize=(floor(random(1))+1); }; //1-2
						case ("Land_Misc_Garb_Heap_EP1"): { _fireSize=(floor(random(1))+5); }; //5-6
						default { _fireSize=4; };
					};
					*/
					
					
					_fireSize = _x getVariable ["addfiresize",1];
				
					_ghkpos = ASLtoATL getPosASL _x;
					//[_x,floor(random(7))+1,time,false,false] spawn BIS_Effects_Burn; 
					[_x,_fireSize,time,false,false] spawn BIS_Effects_Burn; //GHK, make fires a little more consistent across clients
					createSoundSource ["Sound_Fire", _ghkpos, [], 0];
					//diag_log ("created fire at object pos: " + str ( _ghkpos));
					
					//Now 'remove' the object locally from having fires added again.
					_x setVariable ["didfire",true];
					
				};

			} forEach _nearby;
			sleep 1.0;
		
	} forEach _positions;
	
	
  };