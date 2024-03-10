//Let Zeds know
//_id = [player,4,true,(getPosATL player)] spawn player_alertZombies;
if(dz_scoreboard_on) then {
	_th="";
	_tf="";
	_sa =[];
	_cnt=0;
	_color="#5882FA";

	if(dz_scoreboard_type==1) then {
		_th = "<t size='1.2' font='Bitstream' color='#5882FA'>Top 5 Alive:</t><br/><br/>"; 
	//ghk, lets build array of total score, zkills,bkills,mkills,hshots, humanity,playername
	//sort asc on total score.
	}else{
		_th = "<t size='1.2' font='Bitstream' color='#5882FA'>Alive Players:</t><br/><br/>"; 
	};
		{
			if ((Alive _x) && (isPlayer(_x))) then
			{
				//distinguish local player
				if (local _x) then { _color="#ffcc00";} else {_color="#5882FA";};
				_cnt = _cnt + 1;
				 _kills        = _x getVariable["zombieKills",0];
				_killsH    = _x getVariable["humanKills",0];
				_killsB    = _x getVariable["banditKills",0];
				_humanity    = _x getVariable["humanity",0];
				_headShots =  _x getVariable["headShots",0];
				_survival_time = floor((_x getVariable["survival_time",0])/60); //in hours
				_totalScore = ((_killsB*5)+(_kills)+(floor(_headShots/2))+_survival_time);
				_name = (name _x);
				_days = 0;
				_hourlabel ="Hours";
				if(_survival_time == 1) then { _hourlabel ="Hour"; } else {
				if(_survival_time < 1) then { _hourlabel =""; _survival_time="Fresh Meat";}; };
			
			if(dz_scoreboard_type==1) then {	
				_tf = format ["
		<t size='1.0' font='Bitstream' color='#5882FA' align='left'>%8. Player Name:</t><t size='1.0' font='Bitstream' color='%10'align='right'>%1</t><br/>
		<t size='1.0' font='Bitstream' color='#16ba00' align='left'>Score :</t><t size='1.0' font='Bitstream' align='right'>%9</t><br/>
		<t size='0.9' font='Bitstream' align='left'>Zombies Killed: </t><t size='0.9' font='Bitstream' align='right'>%2</t><br/>
		<t size='0.9' font='Bitstream' align='left'>Bandits Killed: </t><t size='0.9' font='Bitstream' align='right'>%5</t><br/>
		<t size='0.9' font='Bitstream' align='left'>Headshots: </t><t size='0.9' font='Bitstream' align='right'>%3</t><br/>
		<t size='0.9' font='Bitstream' align='left'>Murders: </t><t size='0.9' font='Bitstream' align='right'>%4</t><br/>
		<t size='0.9' font='Bitstream' align='left'>Humanity: </t><t size='0.9' font='Bitstream' align='right'>%6</t><br/>
		<t size='0.9' font='Bitstream' align='left'>Survival Time: </t><t size='0.9' font='Bitstream' align='right'>%7 %11</t><br/><br/>",
		(name _x),
		(_x getVariable['zombieKills', 0]),
		(_x getVariable['headShots', 0]),
		(_x getVariable['humanKills', 0]),
		(_x getVariable['banditKills', 0]),
		(_x getVariable['humanity', 0]),
		_survival_time,
		_cnt,
		_totalScore,
		_color,
		_hourlabel
		];
		}else{
		_tf = format ["
		<t size='1.0' font='Bitstream' color='%10' align='left'>%8. %1:</t><t size='1.0' font='Bitstream' color='#16ba00'align='right'>%9</t><br/>",
		(name _x),
		(_x getVariable['zombieKills', 0]),
		(_x getVariable['headShots', 0]),
		(_x getVariable['humanKills', 0]),
		(_x getVariable['banditKills', 0]),
		(_x getVariable['humanity', 0]),
		_survival_time,
		_cnt,
		_totalScore,
		_color,
		_hourlabel
		];
		};
			_ap = [_totalScore,_tf];
			
			_sa set [count _sa, _ap];
			
			};
			


		} forEach allUnits;
		
		
		//GHK define comparison function for fn_ShellSort
		 _calculatePlayerTable = {
		   private ["_totalscore"];
	   
		   _totalscore = _this select 0;
			_totalscore=_totalscore*-1;
			_totalscore;
		};
		
		//_sa sort false; //GHK Arma 3 func.
		_unsorted = _sa;
		_sorted = [];
		
		_sorted = [_unsorted, _calculatePlayerTable] call fn_ShellSort;
		_cnt=0;
		_scoretable = _th + "";
		{
		_pstats = _x select 1;
			_scoretable = _scoretable + _pstats;
		}
		forEach _sorted;
		
	//finally display the table:

	hintSilent parseText _scoretable;

	//display gui (temp hint)

};