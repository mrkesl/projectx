/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
player setVariable ["admin_level", 0, true];
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..

[] execVM "core\init.sqf";
[] execVM "core\functions\fn_emptyFuel.sqf";
[] execVM "core\fn_paycheck.sqf";
//[] execVM "disco.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};
