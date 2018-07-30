/*
	File: fn_entfessel.sqf
*/
params [["_unit", Objnull, [Objnull]]];
private "_curTarget";
_curTarget = cursorTarget;
if(isNull _unit OR !(_unit getVariable["gefesselt",FALSE])) exitWith {}; //Error check?

_unit setVariable["gefesselt",FALSE,TRUE];
_unit setVariable["transport",FALSE,TRUE];
_unit setVariable["imFahrzeug",FALSE,TRUE];
detach _unit;
[_curTarget,"kabelauf"] remoteExec ["life_fnc_soundPlay", 0, false];
