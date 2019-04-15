if (!isServer) exitWith {};

// USB task
[] spawn
{
	_contactArray = [contact_1,contact_2,contact_3,contact_4,contact_5,contact_6,contact_7];
	_contact = selectRandom _contactArray; // Choose a random person to be the contact
	{
		if (_x != _contact) then
		{
			[_x] spawn 
			{
				_cont = _this select 0;
				waitUntil {sleep 1.0; (_cont getVariable "isPickPut_H") || ["usbTask"] call FHQ_fnc_ttAreTasksCompleted};
				
				if (!(["usbTask"] call FHQ_fnc_ttAreTasksCompleted)) then
				{
					hint "You find nothing of interest.";
					sleep 5.0;
					hint "";
				}
				else
				{
					hint "You find the USB key!";
					removeAllActions _cont;
				};
			};
		};
	} forEach _contactArray;
	
	waitUntil {sleep 1.0; (_contact getVariable "isPickPut_H")};
	["usbTask", "succeeded"] call FHQ_fnc_ttSetTaskState;
	sleep 4.0;
	
	// Save the game in singleplayer
	if (savingEnabled) then {saveGame;};
	sleep 1.0;
	
	[comp_1, "Download Files", "Downloading Files", "Download Finished", "Download Interrupted"] call AD_fnc_hack;
	
	["RadioAmbient2"] call AD_fnc_soundAmp;
	["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Good job getting the key, sir. It's a shame we couldn't save Rook.  Now make sure he didn't die in vain. Get to Ravi-ta Island and access the Syndikat lieutenant's laptop. Shadow Out. </t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 12, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
	sleep 12.0;
	
	// Create markers for the laptop's locations
	/*_laptopLocs = [[12436,14225.3],[12527.6,14235.8]];
	for "_i" from 0 to 1 do
	{
		_mkrName = "laptopLoc_"+str(_i);
		_laptopMkr = createMarker [_mkrName, (_laptopLocs select _i)]; 
		_laptopMkr setMarkerShape "ICON"; 
		_mkrName setMarkerType "hd_dot"; 
		_mkrName setMarkerColor "ColorRed"; 
		_mkrName setMarkertext "Location #"+str(_i+1);
	};*/

	// Hack task
	[player, [["hackTask", "primTasks"], "<font color='#D22E2E'>Travel</font> to Ravi-ta Island's <marker name='resortMkr'>hotel resort</marker>, and use the USB key to <font color='#D22E2E'>break into</font> the Syndikat lieutenant's computer and <font color='#D22E2E'>download</font> the Syndikat's <font color='#D22E2E'>operation files</font>. According to Rook, the laptop should be in either the <marker name='resortMkr'>main hotel</marker> or the <marker name='houseMkr'>lieutenant's house</marker>.", "Download Syndikat Files", "", "", "assigned", "DOWNLOAD"]] call FHQ_fnc_ttAddTasks;
	sleep 1.0;

	// Hack task completed
	[] spawn
	{
		waitUntil {sleep 1.0; comp_1 getVariable "isHacked"};
		["hackTask", "succeeded"] call FHQ_fnc_ttSetTaskState;
		sleep 3.0;
		
		// Save the game in singleplayer
		if (savingEnabled) then {saveGame;};
		sleep 1.0;
		
		["RadioAmbient6"] call AD_fnc_soundAmp;
		["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Excellent job sir, we now have their playbook. You can leave now or if you want to stay and give the Syndikat a taste of what's coming, then be my guest. See you on the mainland. Shadow out.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 12, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
	};
	sleep 5.0;
	
	// Save Civilians task
	if (isNil "civsSaved") then 
	{
		["RadioAmbient6"] call AD_fnc_soundAmp;
		["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Sir, one more thing. It looks like some of the villagers fled into the woods.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 7, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
		sleep 9.0;
		
		["<t size='0.6'><t color='#D22E2E'>Shadow:</t> The lieutenant's men have them cornered and are probably gonna execute them.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 7, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
		sleep 9.0;
		
		["<t size='0.6'><t color='#D22E2E'>Shadow:</t> I know we shouldn't get involved, but if you want to do something about it I'm sending you their position. Shadow out.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 8, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
		sleep 5.0;
		
		[player, [["saveTask", "secTasks"], "Save the villagers!", "Save the Villagers", "", getMarkerPos "civsMkr", "created", "HELP"]] call FHQ_fnc_ttAddTasks;
		
		// Save citizens task completed or failed if all civs are dead
		[] spawn
		{
			waitUntil {sleep 1.0; (!isNil "civsSaved") || ({alive _x} count units civsCaptive == 0)};
			
			if ({alive _x} count units civsCaptive > 0) then 
			{	
			
				["saveTask", "succeeded"] call FHQ_fnc_ttSetTaskState;
				sleep 1.0;
				
				// enable ai move and animations for captured civs
				{
					_x enableAI "MOVE";
					_x enableAI "ANIM";
					_x setCaptive false;
				} forEach units civsCaptive;
				
				// Villagers thank Fox
				["<t size='0.6'><t color='#D22E2E'>Villager:</t> Oh thank God, I thought those guys were gonna kill us! Whoever you are, thank you. We owe you our lives!</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 10, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
			}
			else
			{
				["saveTask", "failed"] call FHQ_fnc_ttSetTaskState;
				
				["RadioAmbient8"] call AD_fnc_soundAmp;
				["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Damn! They just shot them! Those Syndikat bastards will get what's coming to 'em soon enough!</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 10, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
			};
		};
		
		// Save citizens task civs executed
		[] spawn
		{
			sleep (random [160, 200, 240]);
			
			if (isNil "civsSaved") then 
			{
				{_x setCaptive false;} forEach units civsCaptive;
			};
		};
	}
	else
	{
		["RadioAmbient8"] call AD_fnc_soundAmp;
		["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Also, good job on saving those villagers earlier, sir! I sure they were very grateful. Shadow out.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 8, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
	};
};

// Backup civs saved checker in-case a player saves the civs before given objectives
[] spawn
{
	waitUntil {sleep 1.0; !isNil "civsSaved"};
	
	// if the save task has not been assigned
	if (["saveTask"] call FHQ_fnc_ttGetTaskState == "") then 
	{
		// enable ai move and animations for captured civs
		{
			_x enableAI "MOVE";
			_x enableAI "ANIM";
			_x setCaptive false;
		} forEach units civsCaptive;
		
		// Villagers thank Fox
		["<t size='0.6'><t color='#D22E2E'>Villager:</t> Oh thank God, I thought those guys were gonna kill us! Whoever you are, thank you. We owe you our lives!</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 10, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
	};
};

// Assassination task completed
[] spawn
{
	waitUntil {sleep 1.0; !alive s_officer};
	
	["killTask", "succeeded"] call FHQ_fnc_ttSetTaskState;
	sleep 3.0;
	
	["RadioAmbient8"] call AD_fnc_soundAmp;
	["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Nice shooting, sir. I hope he burns for what he did to that village. Shadow out.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 10, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
};

// Weapons cache task completed
[] spawn
{
	waitUntil {sleep 1.0; ({alive _x} count [cache_1,cache_2,cache_3,cache_4,cache_5,cache_6]) == 0};
	
	["cacheTask", "succeeded"] call FHQ_fnc_ttSetTaskState;
	sleep 3.0;	
	
	["RadioAmbient6"] call AD_fnc_soundAmp;
	["<t size='0.6'><t color='#D22E2E'>Shadow:</t> Good work, sir. Now we won't have to face Syndikat soldiers shooting at us with our own weapons! Continue on. Shadow out.</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.3, 10, 0.25, 0, 198] remoteExec ["BIS_fnc_dynamicText", [0,-2] select (isMultiplayer && isDedicated)];
};

// Complete primary objectives and activate extraction
[] spawn
{
	waitUntil {sleep 1.0; ["usbTask", "hackTask"] call FHQ_fnc_ttAreTasksCompleted};
	sleep 5.5;
	
	["primTasks", "succeeded"] call FHQ_fnc_ttSetTaskState;
	
	// Activate extraction task
	[player, ["extTask", "<font color='#D22E2E'>Leave</font> <marker name='islandMkr'>Ravi-ta Island</marker> by any means necessary.", "Escape from Ravi-ta", "", "", "assigned"]] call FHQ_fnc_ttAddTasks;	
	sleep 4.0;
	
	[] spawn 
	{
		// Wait until player is out of the radius of the island
		waitUntil {sleep 1.0; !isNil "extracted"};
		
		// Delete the music event handler and play outro music
		removeMusicEventHandler ["MusicStop", ehID]; // remove player's music event handler
		playMusic ["LeadTrack01b_F_EXP",7];
		
		["extTask", "succeeded"] call FHQ_fnc_ttSetTaskState;
		sleep 5.0;
		[] call AD_fnc_thanks;
		
		activateKey "MissionCompleted";
		sleep 17.0;
		["End_Win",true,true,false] remoteExec ["BIS_fnc_endMission"];
	};
};