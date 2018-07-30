/*
	File: fn_unrestrain.sqf
*/
params [["_unit", objNull, [objNull]]];
if(isNull _unit)exitWith{};
	
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
_unit setVariable["gefesselt",FALSE,TRUE];
_unit setVariable["transport",FALSE,TRUE];
_unit setVariable["imFahrzeug",FALSE,TRUE];
detach _unit;
[] spawn life_fnc_setupActions; //Mr.Sears setup actions again
[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]] remoteExec ["life_fnc_broadcast", west, false]; 