#include <macro.h>
/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
*/
params [["_admin", objNull, [ObjNull]]];

if(life_frozen) then {
	hint localize "STR_NOTF_Unfrozen";
	[1,format[localize "STR_ANOTF_Unfrozen",profileName]] remoteExec ["life_fnc_broadcast", _admin, false];
	disableUserInput false;
	life_frozen = false;
	player allowDamage true;
} else {
	hint localize "STR_NOTF_Frozen";
	[1,format[localize "STR_ANOTF_Frozen",profileName]] remoteExec ["life_fnc_broadcast", _admin, false];
	disableUserInput true;
	life_frozen = true;
	player allowDamage false;
}; 