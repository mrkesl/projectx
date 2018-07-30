/*

	file: fn_cleanupMessages.sqf
	Author: Silex

	Description: Deletes all messages that belongs to the given id.
*/
params [["_player", ObjNull, [ObjNull]]];
private "_query";

if(isNull _player) exitWith {};

_query = format["DELETE FROM messages WHERE toID='%1'",getPlayerUID _player];

waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
