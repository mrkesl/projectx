/*
	File: fn_wantedCrimes.sqf
	Author: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	Edit: Creedcoder

	Description:
	Grabs a list of crimes committed by a person.
*/
params [
	["_ret", ObjNull, [ObjNull]],
	["_criminal", [], [[]]]
];
private["_crimes"];
disableSerialization;

_crimes = [(_criminal select 0), 4] call db_fnc_listload;

[_crimes] remoteExec ["life_fnc_wantedInfo", _ret, false];
