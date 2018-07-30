/*
	File: fn_isUIDActive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sees if the UID passed to it is in the server.
	
	Returns:
	True if there was a match, false if not in server.
*/
params [["_uid", "", [""]]];
private["_ret"];
if(_uid == "") exitWith {false}; //Bad UID
_ret = false;
{
	if(getPlayerUID _x == _uid) exitWith {_ret = true;};
} foreach playableUnits;

_ret;