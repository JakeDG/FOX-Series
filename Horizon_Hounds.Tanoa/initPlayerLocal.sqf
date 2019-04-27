waitUntil {!isNull player};

// Disable Teamswitching and sentences
enableTeamSwitch false;
enableSentences false;

waitUntil{!isNil "BIS_fnc_init"};
[player] call AD_fnc_clientLoaded;

if (isNil "introDone") then 
{
	execVM "Scripts\intro.sqf";
};

// If mission is singleplayer, then restart the music event handler every time the mission is loaded from a save
if (!isMultiplayer) then 
{
	waitUntil {sleep 1.0; !isNil "trackList"};
	addMissionEventHandler ["Loaded", 
		{
			[] spawn
			{
				sleep 5.0;
				playMusic (selectRandom trackList);
			};
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
		}
	];
};
