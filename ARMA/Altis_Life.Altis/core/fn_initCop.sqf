#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
// Blacklisted Users
if((player getVariable ["blacklist", false])) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};
// Not Whitelisted Users
if(((player getVariable ["cop_level", 0]) == 0) && ((player getVariable ["admin_level", 0]) == 0)) then
	{
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
// Coprank to low for chosen slot
if((str(player) in ["Major"])) then
	{
		if((player getVariable ["cop_level", 0]) < 8) then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Oberleutnant1","Oberleutnant2"])) then
	{
		if((player getVariable ["cop_level", 0]) < 7) then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Leutnant1","Leutnant2"])) then
	{
		if((player getVariable ["cop_level", 0]) < 6)then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Hauptfeldwebel1","Hauptfeldwebel2","Hauptfeldwebel3"])) then
	{
		if((player getVariable ["cop_level", 0]) < 5)then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Feldwebel1","Feldwebel2","Feldwebel3","Feldwebel4"])) then
	{
		if((player getVariable ["cop_level", 0]) < 4)then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Hauptgefreiter1","Hauptgefreiter2","Hauptgefreiter3","Hauptgefreiter4"])) then
	{
		if((player getVariable ["cop_level", 0]) < 3)then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Gefreiter1","Gefreiter2","Gefreiter3","Gefreiter4","Gefreiter5","Gefreiter6","Gefreiter7"])) then
	{
		if((player getVariable ["cop_level", 0]) < 2)then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};
if((str(player) in ["Rekrut1","Rekrut2","Rekrut3","Rekrut4","Rekrut5","Rekrut6","Rekrut7","Rekrut8"])) then 
	{
		if((player getVariable ["cop_level", 0]) < 1)then
			{
				["NotWhitelisted",false,true] call BIS_fnc_endMission;
				sleep 35;
			};
	};



player setVariable["rank",((player getVariable ["cop_level", 0])),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] execVM "Rageworld\spawncam.sqf";
