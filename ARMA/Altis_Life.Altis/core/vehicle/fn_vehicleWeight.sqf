/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starting to lose track on shit I wrote a year ago..
*/
params [["_vehicle", Objnull, [Objnull]]];
private["_weight","_used"];
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;

if(isNil "_used") then {_used = 0};
[_weight,_used];