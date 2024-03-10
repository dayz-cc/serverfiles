// call with check = ["markerpoint", "markertocheckagainst"] call fnc_isInMarker; for markers
  // call with check = [object, "markertocheckagainst"] call fnc_isInMarker; for objects
  fnc_isInMarker = {
    private ["_p","_m", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_rpx", "_rpy", "_xmin", "_xmax", "_ymin", "_ymax", "_ma", "_res", "_ret"];
    
    _p = _this select 0; // object
    _m = _this select 1; // marker
    
    if (typeName _p == "OBJECT") then {
      _px = position _p select 0;
      _py = position _p select 1;
    } else {
      _px = getMarkerPos _p select 0;
      _py = getMarkerPos _p select 1;
    };
    
    _mpx = getMarkerPos _m select 0;
    _mpy = getMarkerPos _m select 1;
    _msx = getMarkerSize _m select 0;
    _msy = getMarkerSize _m select 1;
    _ma = -markerDir _m;
    _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
    _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
    if ((markerShape _m) == "RECTANGLE") then {
      _xmin = _mpx - _msx;_xmax = _mpx + _msx;_ymin = _mpy - _msy;_ymax = _mpy + _msy;
      if (((_rpx > _xmin) && (_rpx < _xmax)) && ((_rpy > _ymin) && (_rpy < _ymax))) then { _ret=true; } else { _ret=false; };
    } else {
      _res = (((_rpx-_mpx)^2)/(_msx^2)) + (((_rpy-_mpy)^2)/(_msy^2));
      if ( _res < 1 ) then{ _ret=true; }else{ _ret=false; };
    };
    _ret;
  };
  
  
  fnc_getBuildID = {
  
	private ["_build","_sn","_sf","_ef","_na","_id","_i","_item"];

	_build = _this select 0;

	_sn = toArray (str (_build));

	_sf = false;
	_ef = false;
	_na = [];
	_id = 0;

	for "_i" from 0 to (count _sn)-1  do {
		_item = _sn select _i;
		if (_sf and (not (_ef))) then {
			_na set [count _na,_item];
		};
		if (_item == 35) then {
			_sf = true;
		};
		if (_item == 58) then {
			_ef = true;
		};
	};

	if ((count _na) >=3) then {
		_na set [((count _na)-1) ,"delete"];
		_na = _na - ["delete"];
		_na set [0 ,"delete"];
		_na = _na - ["delete"];
		_id = toString (_na);
	};

	_id
  
  
  };
  
  
  // science lab mission.sqm: x,z,y: 7899.8281,266.92825,13644.813
 // _ghkthis = createMarker ["ghkbalota", [4639.8159, 2608.4724, 2.8610229e-006]];
   _ghkthis = createMarker ["ghksciencelab", [7899.8281, 13644.813,266]];
	_ghkthis setMarkerShape "ELLIPSE";
	_ghkthis setMarkerType "Empty";
	_ghkthis setMarkerBrush "Solid";
	_ghkthis setMarkerSize [100, 100];
	_ghkthis setMarkerAlpha 0;
	_ghksciencelab = _ghkthis;		//_dzaicustomspawntest must be a unique name
	_ghkradius = 100;
	
	_ghknearby = getMarkerPos _ghksciencelab nearObjects ["building",600]; //range of 600 for science lab to make sure
	
	
	_ghknearbyCount = count _ghknearby;
	{
		_type = typeOf _x;
	
	if ((_type == "Land_bspawn" || _type == "Land_a_Stationhouse" || _type == "Land_Church_02a" || _type == "Land_Church_02" || _type == "Land_Church_03" || _type == "Land_Church_01" || _type == "Land_Hlidac_budka" || _type == "Land_kulna" || _type == "Land_Mil_Barracks_i")) then {
	
	_x setVariable ["spawn_ns_bloodsucker", 2, true]; //local variable since this runs on server and all clients.
	
	//diag_log format [" science lab building of type %1 of %3 buildings, found set variable to %2",_type,_x getVariable ["spawn_ns_bloodsucker",0],_ghknearbyCount]; 
	
	};
	
	
	} forEach _ghknearby;
	
	
	
   _ghkthis = createMarker ["ghkgreenmountain", [3697.9475, 6002.2476]];
	_ghkthis setMarkerShape "ELLIPSE";
	_ghkthis setMarkerType "Empty";
	_ghkthis setMarkerBrush "Solid";
	_ghkthis setMarkerSize [100, 100];
	_ghkthis setMarkerAlpha 0;
	_ghkgreenmountain = _ghkthis;		//_dzaicustomspawntest must be a unique name
	_ghkradius = 100;
	
	_ghknearby = getMarkerPos _ghkgreenmountain nearObjects ["building",600]; //range of 600 for science lab to make sure
	
	
	_ghknearbyCount = count _ghknearby;
	{
		_type = typeOf _x;
	
	if ((_type == "Land_bspawn" || _type == "Land_a_Stationhouse" || _type == "Land_Church_02a" || _type == "Land_Church_02" || _type == "Land_Church_03" || _type == "Land_Church_01" || _type == "Land_Hlidac_budka" || _type == "Land_kulna" || _type == "Land_Mil_Barracks_i")) then {
	
	_x setVariable ["spawn_ns_bloodsucker", 1, true]; //local variable since this runs on server and all clients.
	
	//diag_log format [" green mountain building of type %1 of %3 buildings, found set variable to %2",_type,_x getVariable ["spawn_ns_bloodsucker",0],_ghknearbyCount]; 
	
	};
	
	
	
	} forEach _ghknearby;
	
	  
	_ghkthis = createMarker ["ghkbszone", (getMarkerPos "center")];
	_ghkthis setMarkerShape "ELLIPSE";
	_ghkthis setMarkerType "Empty";
	_ghkthis setMarkerBrush "Solid";
	_ghkthis setMarkerSize [100, 100];
	_ghkthis setMarkerAlpha 0;
	_ghkBSZone = _ghkthis;		//_dzaicustomspawntest must be a unique name
	
	dayz_BSZonePos = player distance GetMarkerPos "ghkbszone";