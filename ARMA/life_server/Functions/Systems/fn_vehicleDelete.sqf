/*
	File: fn_vehicleDelete.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Doesn't actually delete since we don't give our DB user that type of
	access so instead we set it to alive=0 so it never shows again.
*/
params[
	["_vehicle", objNull,[objNull]]
];
private ["_vehicleList"];
if(isNull _vehicle) exitWith {};

_key = _vehicle getVariable["plate",""];
if(_key == "") exitWith {deleteVehicle _vehicle;};

[_key, 3] call db_fnc_listdel;
_vehicleList = ["Index", 3] call db_fnc_load;
_vehicleList = _vehicleList - [_key];
["Index", str _vehicleList, 3] spawn db_fnc_save;
deleteVehicle _vehicle;
