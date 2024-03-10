if (isNil "custom_monitor") then {custom_monitor = true;} else {custom_monitor = false;};
while {custom_monitor} do
{ 
if(!dz_scoreboard_on&&dz_custom_monitor_on) then {
    _kills        = player getVariable["zombieKills",0];
    _killsH    = player getVariable["humanKills",0];
    _killsB    = player getVariable["banditKills",0];
    _humanity    = player getVariable["humanity",0];
    _headShots =  player getVariable["headShots",0];
	_survival_time = floor((player getVariable["survival_time",0])/60); //in hours
	_tlval = (round(dayz_restart_period-(serverTime)/60));
	_tlcolor = "#5882FA";
	_hourlabel ="Hours";
	_totalscore = ((_killsB*5)+(_kills)+(floor(_headShots/2))+_survival_time);
	if(_survival_time == 1) then { _hourlabel ="Hour"; } else {
	if(_survival_time < 1) then { _hourlabel =""; _survival_time="Fresh Meat";}; };
	
	if (_tlval<=5) then {
		_tlcolor = "#ff0000";
	};
	
	
     _pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
            if (player == vehicle player) then
            {
                _pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
            }
                else
            {
                _pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
            };
			
	
    hintSilent parseText format ["
    <t size='2'font='Bitstream'align='center' color='#5882FA' >%1</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Survival Time :</t><t size='1'font='Bitstream'align='right'>%2 %14</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Blood :</t><t size='1.25' font='Bitstream'align='right'>%3</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Humanity :</t><t size='1'font='Bitstream'align='right'>%4</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Murder :</t><t size='1'font='Bitstream'align='right'>%5</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Bandits Killed :</t><t size='1'font='Bitstream'align='right'>%6</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Zombies Killed :</t><t size='1'font='Bitstream'align='right'>%7</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>Headshots :</t><t size='1'font='Bitstream'align='right'>%8</t><br/>
    <t size='1'font='Bitstream'align='left'color='#ffcc00'>FPS :</t><t size='1'font='Bitstream'align='right'>%9</t><br/>
	<t size='0.9'font='Bitstream'align='center'>%15</t><br/>
    <img size='3' image='%10'/><br/>  
	<t size='1.15' font='Bitstream'align='center' color='%13'>Restart in %11 Minutes</t><br/>
    <t size='1.25'font='Bitstream'align='left'color='#16ba00'>Score :</t><t size='1.25'font='Bitstream'align='right'>%12</t>
    ",str(name player),(_survival_time),r_player_blood,(round(_humanity)),_killsH,_killsB,_kills,_headShots,floor(diag_fps),_pic,_tlval,_totalscore,_tlcolor,_hourlabel,dayz_motd];
    sleep 1;
	//SCORE USED TO BE:,(round(_humanity)+(_killsB*5)+(_kills)+(floor(_headShots/2))+dayz_skilllevel)
};
};