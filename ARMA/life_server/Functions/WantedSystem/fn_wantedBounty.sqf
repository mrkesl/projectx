/*
	File: fn_wantedBounty.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	Edit: Creedcoder

	Description:
	Checks if the person is on the bounty list and awards the cop for killing them.
*/
params [
["_uid", "", [""]],
["_civ", Objnull, [Objnull]],
["_cop", Objnull, [Objnull]],
["_half", false, [false]]
];
private["_crimes","_amount"];

if(isNull _civ OR isNull _cop) exitWith {};

_crimes = [_uid, 4] call db_fnc_listload;
if(count _crimes != 0) then {
	_amount = 0;
	{
		_amount = _amount + (_x select 1);
	} forEach _crimes;
	if(_half) then {
		[((_amount) / 2),_amount] remoteExec ["life_fnc_bountyReceive", _unit, false];
	} else {
		[_amount,_amount] remoteExec ["life_fnc_bountyReceive", _cop, false];
	};
};
