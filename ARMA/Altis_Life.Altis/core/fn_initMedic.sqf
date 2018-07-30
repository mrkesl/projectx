#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((player getVariable ["medic_level", 0]) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};
if((str(player) in ["Chefarzt"])) then
	{
		if((player getVariable ["medic_level", 0]) < 3) then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

player setVariable["rank",(player getVariable ["medic_level", 0]),true];


