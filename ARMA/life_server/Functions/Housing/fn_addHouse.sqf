/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Blah
*/
params[
	["_netid","",[""]],
	["_owner",[],[[]]]
	];
private ["_houses"];
if(_netid == "") exitWith {};
[_netid, format["[%1,[[],0],[]]", _owner], 2] spawn db_fnc_save;

_houses = ["Index", 2] call db_fnc_load;
_houses pushBack _netid;
["Index", str _houses, 2] spawn db_fnc_save;
