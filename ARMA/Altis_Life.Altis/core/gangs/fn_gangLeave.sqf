#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];
player setVariable ["gang", "", true];
[player] joinSilent (createGroup civilian);

[4,_grp] remoteExec ["TON_fnc_updateGang", 2, false];
closeDialog 0;