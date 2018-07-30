/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder ;P
	Description:
	Blah
*/
params [["_group", grpNull, [grpNull]]];
private "_groupID";
if(isNull _group) exitWith {};

_groupID = _group getVariable["gang_id",""];
if(_groupID == "") exitWith {};

[_groupID, 1] call db_fnc_delete;
[_group] remoteExec ["life_fnc_gangDisbanded", (units _group), false];
sleep 5;
deleteGroup _group;