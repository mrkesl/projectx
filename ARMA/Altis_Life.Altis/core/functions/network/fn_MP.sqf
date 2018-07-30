/*
	Author: Karel Moricky

	Description:
	Send function for remote execution (and executes locally if conditions are met)

	Parameter(s):
		0: ANY - function params
		1: STRING - function name
		2 (Optional):
			BOOL - true to execute on every client, false to execute it on server only
			OBJECT - the function will be executed only where unit is local [default: everyone]
			GROUP - the function will be executed only on client who is member of the group
			SIDE - the function will be executed on all players of the given side
			NUMBER - the function will be executed only on client with the given ID
			ARRAY - array of previous data types
		3 (Optional): BOOL - true for persistent call (will be called now and for every JIP client) [default: false]
	
	Returns:
	ARRAY - sent packet
*/

with missionnamespace do {
	params [["_params", 0, []], ["_functionName", "", [""]], ["_target", true, [objnull,true,0,[],sideUnknown,grpnull,""]], ["_isCall", false, [false]]];
	private ["_isPersistent","_ownerID"];
	_isPersistent =	false; //Persistent capabilities removed due to I fucking hate that option.

	//--- Send to server
	if(isServer && isDedicated) then {
		life_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];
	} else {
		life_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,profileName,getPlayerUID player];
	};
	publicvariableserver "life_fnc_MP_packet";

	//--- Local execution
	if !(ismultiplayer) then {
		["life_fnc_MP_packet",life_fnc_MP_packet] spawn life_fnc_MPexec;
	};

	life_fnc_MP_packet
};