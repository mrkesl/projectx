/*
	File: fn_lockVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/
params [["_vehicle", Objnull, [Objnull]], ["_state", 2, [0,false]]];
private["_vehicle","_state"];
if(isNull _vehicle) exitWith {};

_vehicle lock _state;