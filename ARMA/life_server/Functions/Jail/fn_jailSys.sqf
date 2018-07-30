/*
File: fn_jailSys.sqf
Author: Bryan "Tonic" Boardwine

Description:
I forget?
*/
params [["_unit", ObjNull, [ObjNull]], ["_bad", false, [false]], ["_time", 15, [0]]];
private["_id","_ret"];
if(isNull _unit) exitWith {};

_ret = [_unit] call life_fnc_wantedPerson;
[_ret,_bad,_time] remoteExec ["life_fnc_jailMe", _unit, false];
