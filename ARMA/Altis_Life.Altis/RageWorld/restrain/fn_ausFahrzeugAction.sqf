/*
	File: fn_ausFahrzeugAction.sqf
	Author: Bryan "Tonic" Boardwine / Ragebone
	
	Description:
	Pulls ziptied out of a car if it's stopped.
*/
private["_crew","_lock"];
_crew = crew cursorTarget;
_lock = locked cursorTarget;
//hint format[" das nachstgelegene Fahrzeug ist :%1     offen<2<verschlossen.  -1= null",_lock];
if((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "")then{
	{
		if(_x getVariable"gefesselt" ) then  //  && _lock == 0
		{
			_x setVariable ["imFahrzeug",false,true]; _x setVariable ["transport",false,true];
			[_x] remoteExec ["life_fnc_ausFahrzeug", _x, false];
		};
	} foreach _crew;
};	