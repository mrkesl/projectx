/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine
	Edit. Creedcoder
	Description:
	Stores the vehicle in the 'Garage'
*/
params [
	["_vehicle",ObjNull,[ObjNull]],
	["_impound",false,[true]],
	["_unit",ObjNull,[ObjNull]],
	["_pimpound",false,[true]]
];
private["_db","_key","_uid"];

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.

_key = _vehicle getVariable["plate",""];
_uid = _vehicle getVariable["vehicle_info_owners",[]];

_fuelvalue = fuel _vehicle;

if(_pimpound) then
{
	if(_key == "") then
	{
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			{deleteVehicle _x;} foreach (attachedObjects (_vehicle));
			deleteVehicle _vehicle;
		};
	}
		else
	{
		_db = 3; //Vehicle
		[_key, 2, false, _db] spawn db_fnc_listset; //active false
		[_key, 4, true, _db] spawn db_fnc_listset; //Impound true
		[_key, 5, _fuelvalue, _db] spawn db_fnc_listset; //fuel save
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			{deleteVehicle _x;} foreach (attachedObjects (_vehicle));
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
} else {
if(_impound) then
{
	if(_key == "") then
	{
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			{deleteVehicle _x;} foreach (attachedObjects (_vehicle));
			deleteVehicle _vehicle;
		};
	}
		else
	{
		_db = 3; //Vehicle
		[_key, 2, false, _db] spawn db_fnc_listset; //active false
		[_key, 4, false, _db] spawn db_fnc_listset; //Impound false
		[_key, 5, _fuelvalue, _db] spawn db_fnc_listset; //fuel save
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			{deleteVehicle _x;} foreach (attachedObjects (_vehicle));
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
}
	else
{
	if(_key == "") exitWith
	{
		[1,(localize "STR_Garage_Store_NotPersistent")] remoteExec ["life_fnc_broadcast", (owner _unit), false];
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};

	if((_uid select 0) select 0 != getPlayerUID _unit) exitWith
	{
		[1,(localize "STR_Garage_Store_NoOwnership")] remoteExec ["life_fnc_broadcast", (owner _unit), false];
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};

	_db = 3; //Vehicle
	[_key, 2, false, _db] spawn db_fnc_listset; //active false
	[_key, 4, false, _db] spawn db_fnc_listset; //Impound false
	[_key, 5, _fuelvalue, _db] spawn db_fnc_listset; //fuel save
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		{deleteVehicle _x;} foreach (attachedObjects (_vehicle));
		deleteVehicle _vehicle;
	};
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
	[1,(localize "STR_Garage_Store_Success")] remoteExec ["life_fnc_broadcast", (owner _unit), false];
};
};
