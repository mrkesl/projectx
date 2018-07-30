/*
	File: fn_wantedPerson.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	Edit: Creedcoder

	Description:
	Fetches a specific person from the wanted array.
*/
params [["_unit", ObjNull, [ObjNull]]];
private["_result"];
if(isNull _unit) exitWith {[]};
_uid = getPlayerUID player;

_result = [_uid, 4] call db_fnc_listload;
if(count _result == 0) exitWith {[]};
_result;
