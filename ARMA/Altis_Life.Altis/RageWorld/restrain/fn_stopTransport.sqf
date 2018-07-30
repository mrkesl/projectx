/*
	File: fn_stopEscorting.sqf
	
	Description:
	ASFSDFHAGFASF
*/
params [["_unit", Objnull, [Objnull]]];
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "transport")) exitWith {}; //He's not being Escorted.
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["transport",false,true];