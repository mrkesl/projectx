/*
	File: fn_vehicleCreate.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Answers the query request to create the vehicle in the database.
*/
params[
	["_key","",[""]],
	["_vehicle",ObjNull,[ObjNull]],
	["_color",-1,[0]]
];
private["_type","_classname"];

//Error checks
if(_key == "" OR isNull _vehicle) exitWith {};
if(!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch(true) do
{
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
};

_data = [_className, _type, true, _color, false, 1,""];
[_key, _data, 3] spawn db_fnc_listadd;

_vehicleList = ["Index", 3] call db_fnc_load;
_vehicleList pushBack _key;
["Index", str _vehicleList, 3] spawn db_fnc_save;

_vehicle setVariable["plate", _key, true];
_vehicle setVariable["box",false,true];

//Creedcoder Redis Cleanup
_vehicle addMPEventHandler ["mpKilled",{
	if(isServer) then {
		_this spawn TON_fnc_vehicleDead;
	} else {
		_vehicles = player getVariable["vehicles",[]];
		_vehicles deleteAt (_vehicles find ((_this select 0) getVariable["plate",""]));
		player setVariable["vehicles",_vehicles, true];
	};
}];
[_vehicle] remoteExec ["life_fnc_getin", 0, true];
