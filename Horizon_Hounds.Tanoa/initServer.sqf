if (!isServer) exitWith {};

/******************** SERVER VARIABLES ***********************/

/******************** SERVER SCRIPTS ***********************/
execVM "briefing.sqf";
execVM "Scripts\serverTaskTrack.sqf";
execVM "Scripts\laptopOptions.sqf";

/******************** REMOTE EXECS ***********************/
// Add action to ammoboxes
{
	[_x, [ "<t color='#D22E2E'>Open Virtual Arsenal</t>",{ ["Open",true] spawn BIS_fnc_arsenal; },[],10,true,true,"","(_target distance _this) < 3.5"] ] remoteExec [ "addAction", [0,-2] select (isMultiplayer && isDedicated), _x];
} forEach [arsenal_1,arsenal_2];

// Add action to mobile arsenal drone, ensure player operating it cannot use the arsenal while using it
[arsenal_drone, [ "<t color='#D22E2E'>Open Virtual Arsenal</t>",{ ["Open",true] spawn BIS_fnc_arsenal; },[],10,true,true,"","(_target distance _this) < 5 && ((UAVControl _target) select 1) != 'DRIVER' && ((UAVControl _target) select 1) != 'GUNNER'"] ] remoteExec [ "addAction", [0,-2] select (isMultiplayer && isDedicated), (alive arsenal_drone)];

/******************** MISSION PARAMETERS ***********************/

/******************** OTHER SERVER STUFF ***********************/
// Kill power at village
_lampTypes = ["Lamps_Base_F", "Land_LampHarbor_F"];

for [{_i=0},{_i < (count _lampTypes)},{_i=_i+1}] do
{
	_lamps = getMarkerPos "villageMkr" nearObjects [_lampTypes select _i, 200];
	sleep 0.1;
	{_x setDamage 0.95} forEach _lamps;
};

// Set forecast randomly (may start raining)
_overcast = 1 random [0,1];
_time = random [1800,2700,3600]; // Weather change between 30, 45, and 60 minutes
_time setOvercast _overcast;

// Add "search" action to dead villagers
{
	[_x, "Search Body", 3, true] call AD_fnc_pickPutHold; 
} forEach [contact_1,contact_2,contact_3,contact_4,contact_5,contact_6, contact_7];

// Randomize Laptop location (else the laptop will stay in the main resort)
if (floor(random 2) == 1) then
{ 
	comp_1 setPosATL [12527.6,14235.8,1.02101];
	comp_1 setDir 186;
};

// Randomize lieutenant's position
_offPosDir = selectRandom [
							[[12269.6,13942.9,0.616364], 198], // House #1, kitchen
							[[12274.9,13943.3,0.616364], 50], // House #1, bedroom
							[[12255.8,13964,0.406995], 205], // House #2, by TV
							[[12259.9,13962.9,0.407292], 117], // House #2, by front window
							[[12249,13997.4,0.770225], 230], // House #3, by whiteboards
							[[12248.8,14004.7,0.534271], 172], // House #3, in kitchen
							[[12289.2,13994.8,0.373319], 203], // House #4, by rifle
							[[12284.7,13998,0.433597], 19], // House #4, by workbench
							[[12292.5,13946.3,0.269078], 140], // House #5, by desk
							[[12297.2,13949.7,0.321669], 103] // House #5, by back door cabinet
						];
s_officer setPosATL (_offPosDir select 0);
s_officer setDir (_offPosDir select 1);

// Add flashlights to militia guns
[] spawn 
{
	{
		if ((side _x) == independent) then
		{
			_x addPrimaryWeaponItem "acc_flashlight";
			sleep 0.2;
			_x enablegunlights "forceOn";
		};
	} forEach allUnits;
};

// Randomize fuel levels for all cars except the starting jetski and any enemy vehicle patrols
[] spawn 
{
	{
		if (_x != startVeh && isNull driver _x) then 
		{
			_x setFuel (random [0.20, 0.50, 0.90]);
		};
	} forEach vehicles;
};

// Create ambient music track list
trackList = [
			"BlackMarket",
			"Deception",
			"Elusive",
			"Hitman",
			"Incognito",
			"Operative",
			"Scout",
			"Subsonic",
			"Tactical"
		];
publicVariable "trackList";

// Create event handler to produce the ambient soundtrack 
ehID = addMusicEventHandler [
								"MusicStop", 
								{
									[] spawn
									{
										sleep 5.0;
										playMusic (selectRandom trackList);
									};
								}
							];
							
waitUntil{sleep 1.0; !isNil "BIS_fnc_init"}; // Wait until server is ready
waitUntil{sleep 1.0; {_x getVariable ["isClientLoaded",false]} count (allPlayers - entities "HeadlessClient_F") == count (allPlayers - entities "HeadlessClient_F")}; // Wait until clients are all loaded
serverLoaded = true;
publicVariable "serverLoaded"; 