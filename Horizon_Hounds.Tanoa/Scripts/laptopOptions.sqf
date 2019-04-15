// Add options to old laptop at starting docks

if (!isServer) exitWith {};

// Create skip time action
[
	optLaptop,                                                                           		// Object the action is attached to
	"<t color='#D22E2E'>Skip to Night</t>",                                                    	// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      			// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                     			 // Progress icon shown on screen
	"((_target distance _this < 3) && (alive _target))",                                      	// Condition for the action to be shown
	"((_caller distance _target < 3) && (alive _target) && (!isNull _this))",                   	// Condition for the action to progress
	{},                                                            						 // Code executed when action starts
	{																					// Code executed on every progress tick 					
	},
	{																					// Code executed on completion
		_target = _this select 0;
		_caller = _this select 1;
		_id = _this select 2;
			
		[_target, _id] remoteExec ["BIS_fnc_holdActionRemove", [0,-2] select (isMultiplayer && isDedicated), _target ];
			
		100 cutText ["Skipping Time...", "BLACK OUT", 5];
		_caller enableSimulation false;
		5 fadeSound 0;
		5 fadeMusic 0;
		sleep 10.0;
		skipTime 1;
		100 cutText ["1 Hour Later...", "BLACK IN", 15];
		5 fadeSound 1;
		5 fadeMusic 1;
		sleep 3.0;
		_caller enableSimulation true;
		
	},                                                									
	{																					// Code executed on interrupted
	},                                                                 
	[],                                                                         	 // Arguments passed to the scripts as _this select 3
	2,                                                                            // Action duration [s]
	10,                                                                                  // Priority
	true,                                                                                // Remove on completion
	false                                                                                // Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select (isMultiplayer && isDedicated), optLaptop];

// Create disable stamina action
[
	optLaptop,                                                                           		// Object the action is attached to
	"<t color='#D22E2E'>Disable Stamina</t>",                                                    	// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",                      			// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",                     			 // Progress icon shown on screen
	"((_target distance _this < 3) && (alive _target))",                                      	// Condition for the action to be shown
	"((_caller distance _target < 3) && (alive _target) && (!isNull _this))",                   	// Condition for the action to progress
	{},                                                            						 // Code executed when action starts
	{																					// Code executed on every progress tick 					
	},
	{																					// Code executed on completion
		_target = _this select 0;
		_caller = _this select 1;
		_id = _this select 2;
			
		[_target, _id] remoteExec ["BIS_fnc_holdActionRemove", [0,-2] select (isMultiplayer && isDedicated), _target ];
		
		_caller enableFatigue false;
		
		hint "Stamina Disabled"
	},                                                									
	{																					// Code executed on interrupted
	},                                                                 
	[],                                                                         	 // Arguments passed to the scripts as _this select 3
	2,                                                                            // Action duration [s]
	10,                                                                                  // Priority
	true,                                                                                // Remove on completion
	false                                                                                // Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select (isMultiplayer && isDedicated), optLaptop];
