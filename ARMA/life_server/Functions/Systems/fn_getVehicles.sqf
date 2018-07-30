/*
	File: fn_getVehicles.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Sends a request to query the database information and returns vehicles.
*/
params[
	["_keys", [],[[]]],
	["_type", "",[""]],
	["_unit", ObjNull,[ObjNull]]
];
private["_query","_tickTime"];

//Error checks
if(str _keys == "[]" OR _type == "" OR isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[]] remoteExec ["life_fnc_impoundMenu", _unit, false];
	};
};

_tickTime = diag_tickTime;

_query = [];
{
    _tmp = [_x, 3] call db_fnc_listload;
		_tmp pushback _x;
		if(!(_tmp select 4) && {!(_tmp select 2)} && {(_tmp select 1) == _type}) then {
			_query pushBack _tmp;
		};
} forEach _keys;

[_query] remoteExec ["life_fnc_impoundMenu", _unit, false];

diag_log "------------- Client Query Request -------------";
diag_log format["Keys: %1",_keys];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_query];
diag_log "------------------------------------------------";
