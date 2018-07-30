/*
	File: fn_vehicleDead.sqf
	Edit: Creedcoder
	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
params[
	["_vehicle", ObjNull,[ObjNull]]
];
private["_time"];

if(isNull _vehicle) exitWith {};
_key = _vehicle getVariable["plate",""];
if(_key == "") exitWith {};

[_key, 3] call db_fnc_listdel;
_time = true call db_fnc_time;
["Vehicle_Destroy.log", format["%1 Vehicle: %2 with Key: %3 destroyed!", _time, typeOf _vehicle, _key]] call db_fnc_log;

_vehicleList = ["Index", 3] call db_fnc_load;
_vehicleList = _vehicleList - [_key];
["Index", str _vehicleList, 3] spawn db_fnc_save;

sleep (1.3 * 60);
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};
