/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	Edit: Creedcoder

	Description:
	Displays wanted list information sent from the server.
*/
params [["_ret", ObjNull, [ObjNull]]];
private["_list","_keys"];
if(isNull _ret) exitWith {};
_ret = owner _ret;
_inStatement = "";
_list = [];
_keys = [];
_tickTime = diag_tickTime;
{
	if((side _x) == civilian) then {
		_keys pushBack [(getPlayerUID _x), name _x];
	};
} foreach allPlayers;

{
	_crimes = [(_x select 0), 4] call db_fnc_listload;
	if(count _crimes > 0) then {
		_list pushBack _x;
	};
} forEach _keys;

if(count _list == 0) exitWith {[_list] remoteExec ["life_fnc_wantedList", _ret, false];};

[_list] remoteExec ["life_fnc_wantedList", _ret, false];

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_keys];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_list];
diag_log "------------------------------------------------";
