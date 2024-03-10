if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "custom\player_monitor.fsm";