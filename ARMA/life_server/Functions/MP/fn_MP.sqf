/*
	Author: Karel Moricky

	Description:
	Send function for remote execution (and executes locally if conditions are met)

	Parameter(s):
		0: ANY - function params
		1: STRING - function name
		2 (Optional):
			BOOL - true to execute on each machine (including the one where the function was called from), false to execute it on server only [default: true]
			STRING - the function will be executed only where unit defined by the variable is local
			OBJECT - the function will be executed only where unit is local
			GROUP - the function will be executed only on client who is member of the group
			SIDE - the function will be executed on all players of the given side
			NUMBER - the function will be executed only on client with the given ID
			ARRAY - array of previous data types
		3 (Optional): BOOL - true for persistent call (will be called now and for every JIP client) [default: false]
	
	Returns:
	ARRAY - sent packet
*/

with missionnamespace do {
	params [
	["_params", [], [[]]],
	["_functionName", "", [""]],
	["_target", true, [objnull,true,0,[],sideUnknown,grpnull,""]],
	["_isPersistent", false, [false]],
	["_isCall", false, [false]]
	];

	//--- Send to server
	BIS_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall];
	publicvariableserver "BIS_fnc_MP_packet";

	//--- Local execution
	if !(ismultiplayer) then {
		["BIS_fnc_MP_packet",BIS_fnc_MP_packet] spawn BIS_fnc_MPexec;
	};

	BIS_fnc_MP_packet
};