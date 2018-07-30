/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder ;P
	Description:
	Updates the gang information?
*/
params [["_mode", 0, [0]], ["_group", grpNull, [grpNull]]];
private["_groupID","_maxMembers","_members","_query","_membersFinal"];

if(isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable["gang_id", ""];
if(_groupID == "") exitWith {};

_query = [];
_query pushback (_group getVariable["gang_id",""]);
_query pushback (_group getVariable["gang_owner",""]);
_query pushback (_group getVariable["gang_name",""]);
_query pushback (_group getVariable["gang_maxMembers",8]);
_query pushback (_group getVariable["gang_bank",0]);
_members = _group getVariable ["gang_members",[]];
if(count _members > (_group getVariable ["gang_maxMembers",8])) then {
	_membersFinal = [];
	for "_i" from 0 to _maxMembers -1 do {
		_membersFinal pushBack (_members select _i);
	};
	_query pushback _membersFinal;
} else {
	_query pushback _members;
};


[_groupID, str _query, 1] spawn db_fnc_save;
