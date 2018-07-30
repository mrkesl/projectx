/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
params [["_unit", objNull, [objNull]], ["_time",30,[0]]];
private["_id"];

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(_time < 1) exitwith {}; //Not Valid

[getPlayerUID _unit,_unit,player,false] remoteExec ["life_fnc_wantedBounty", 2, false];

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false,_time] remoteExec ["life_fnc_jail", _unit, false];
[0,format[(localize "STR_NOTF_Arrested_1"), _unit getVariable["realname",name _unit], profileName]] remoteExec ["life_fnc_broadcast", 0, false];