params [["_vehicle", Objnull, [Objnull]]];
private["_weight","_used"];
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfgboxed;

if(isNil "_used") then {_used = 0};
[_weight,_used];