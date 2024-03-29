// Creates the intro
player enableSimulation false;

if (isMultiplayer) then 
{
	100 cutText ["", "BLACK FADED", 999];
	100 cutText ["Server Loading...", "BLACK FADED", 999];
	0 fadeSound 0;
	5 fadeMusic 1;
	enableRadio false;
	enableEnvironment false;	
	clearRadio;
	waitUntil {sleep 1; !isNil "serverLoaded"};
	100 cutText ["Server Loaded", "BLACK FADED", 999];
}
else
{
	100 cutText ["", "BLACK FADED", 999];
	100 cutText ["Mission Loading...", "BLACK FADED", 999];
	0 fadeSound 0;
	5 fadeMusic 1;
	enableRadio false;
	enableEnvironment false;	
	clearRadio;
	waitUntil {sleep 1; !isNil "serverLoaded"};
	100 cutText ["Mission Loaded", "BLACK FADED", 999];
};
sleep 1.0;
100 cutText ["", "BLACK FADED", 999];
	
sleep 5.0;
playMusic "Hotell";
//["<t  size = '1.0'>Two weeks after Sabre Team's arrival...</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.85, 4, 4, 0, 200] spawn BIS_fnc_dynamicText;
101 cutText ["<t size='2.0'>Two weeks after Sabre Team's arrival...</t>", "BLACK", 4.0,true,true];
sleep 6.0;
101 cutFadeOut 1.0;
sleep 4.0;

//["<t size='1.0' color='#D22E2E'>AlphaDog Presents...</t>", safeZoneX+0.45, safeZoneY+safeZoneH-0.85, 4, 4, 0, 200] spawn BIS_fnc_dynamicText;
101 cutText ["<t size='2.0' color='#D22E2E'>AlphaDog Presents...</t>", "BLACK", 4.0,true,true];
sleep 6.0;
101 cutFadeOut 1.0;
sleep 4.0;

//["<t  size = '3.0' shadow = '0'color='#D22E2E'>FOX:</t><t  size = '3.0'> Horizon Hounds</t>", safeZoneX+0.45,safeZoneY+safeZoneH-0.9, 8, 7, 0, 200] spawn BIS_fnc_dynamicText;
101 cutText ["<t  size = '5.0' shadow = '0' color='#D22E2E'>FOX:<br/></t><t  size = '5.0' shadow = '0'>Horizon Hounds</t>", "BLACK", 4.0,true,true];
sleep 4.0;
101 cutFadeOut 4.5;

100 cutText ["", "BLACK IN", 15];
player enableSimulation true;
5 fadeSound 1;
5 fadeMusic 1;
enableRadio true;
enableEnvironment true;
enableSentences true;

sleep 12.0;
_date = [] call AD_fnc_getDate;
_time = [] call AD_fnc_getTime;
_text = 
	[ 
		["Agent Fox","<t color='#D22E2E' font='PuristaBold'>%1</t><br/>",8], 
		["La Rochelle Docks, Tanoa","<t font='PuristaMedium'>%1</t><br/>",8],
		[_time + " Hours","<t font='PuristaMedium'>%1</t><br/>",8],		
		[_date,"<t font='PuristaMedium'>%1</t><br/>",20] 
	]; 
[_text,-safezoneX,safeZoneY+safeZoneH-0.4,"<t align='center'>%1</t>"] spawn BIS_fnc_typeText;

introDone = true;