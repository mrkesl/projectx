/*

	file: fn_msgRequest.sqf
	Author: Silex
	
	Fills the Messagelist
*/
params [["_uid", "", [""]], ["_player", ObjNull, [ObjNull]]];
private["_query","_queryResult"];
_query = format["SELECT fromID, toID, message, fromName, toName FROM messages WHERE toID='%1' ORDER BY time DESC LIMIT 10",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(count _queryResult == 0) exitWith {};
{
	[1,_x] remoteExec ["life_fnc_smartphone", _player, false];
}forEach _queryResult;