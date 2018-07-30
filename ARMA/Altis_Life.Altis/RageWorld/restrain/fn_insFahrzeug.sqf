/*
	File: fn_insFahrzeug.sqf
	Author: Bryan "Tonic" Boardwine / Ragebone
	
	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
params [["_unit", Objnull, [Objnull]]];
private "_lock";
if(isNull _unit OR !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],5] select 0;
if(isNil "_nearestVehicle") exitWith {hint localize "STR_NOTF_VehicleNear"};
_lock = locked _nearestVehicle;
hint format[" das nachstgelegene Fahrzeug ist :%1     offen<2<verschlossen.  -1= null",_lock];
//if(_lock == 2)exitWith{hint"Das nächste Fahrzeug ist nicht offen!";};

detach _unit;
[_nearestVehicle] remoteExec ["life_fnc_moveIn", _unit, false];
_unit setVariable["transport",FALSE,TRUE];
_unit setVariable["imFahrzeug",TRUE,TRUE];