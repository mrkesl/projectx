#include <macro.h>
/*
	File: fn_freezePlayer_all.sqf
	Author: ColinM9991
	Edited for call from fnc_adminFreeze_all
 
	Description: Freezes selected player
*/
if((player getVariable ["admin_level", 0]) > 0) exitWith {}; 

if(life_frozen) then {
	disableUserInput false;
	life_frozen = false;
} else {
	disableUserInput true;
	life_frozen = true;
}; 