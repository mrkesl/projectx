#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder ;P
	Description:
	Prompts the player about an invite.
*/
params [["_name", "", [""]], ["_group", grpNull, [grpNull]]];
private["_groupID"];
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint "Du bist bereits in einer Gang!"};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	_groupID = _group getVariable["gang_id", ""];
	if(_groupID == "") exitWith {};
	[player] join _group;
	player setVariable ["gang", _groupID, true];
	[4,_group] remoteExec ["TON_fnc_updateGang", 2, false];
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[4,_grpMembers] remoteExec ["TON_fnc_updateGang", 2, false];
};