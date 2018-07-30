/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
params [["_cop", ObjNull, [ObjNull]]];
private["_inv","_var","_val","_robber"];
if(isNull _cop) exitWith {};
_inv = [];
_robber = false;
//Illegal items
{
	_var = [_x select 0,0] call life_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call life_fnc_handleInv;
	};
} foreach life_illegal_items;

if(!life_use_atm) then 
{
	player setvariable["cash", 0, true];
	_robber = true;
};

[player,_inv,_robber] remoteExec ["life_fnc_copSearch", _cop, false];