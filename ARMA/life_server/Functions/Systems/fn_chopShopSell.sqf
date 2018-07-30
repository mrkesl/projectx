/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
params[
	["_unit",objNull,[objNull]],
	["_vehicle",objNull,[objNull]],
	["_price",500,[0]],
	["_cash",0,[0]]
];
private["_displayName","_key"];

if(isNull _vehicle OR isNull _unit) exitWith {
	["life_action_inUse",false] remoteExec ["life_fnc_netSetVar", 0, false];
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_key = _vehicle getVariable["plate",""];
if(_key != "") then {
	[_key, 3] call db_fnc_listdel;
	_vehicleList = ["Index", 3] call db_fnc_load;
	_vehicleList = _vehicleList - [_key];
	["Index", str _vehicleList, 3] spawn db_fnc_save;
};

deleteVehicle _vehicle;
["life_action_inUse",false] remoteExec ["life_fnc_netSetVar", _unit, false];
_unit setvariable["cash", _cash, true];
[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", _unit, false];
