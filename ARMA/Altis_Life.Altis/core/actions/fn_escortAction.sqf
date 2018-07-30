/*
	File: fn_escortAction.sqf
*/
params [["_unit", objNull, [objNull]]];
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if(!(side _unit in [civilian,independent])) exitWith {};
if(player distance _unit > 3) exitWith {};
if((!(_unit getVariable ["restrained",false])) && (!(_unit getVariable ["gefesselt", false]))) exitWith {hint "Du solltest die Person schon festnehmen...";};
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;
