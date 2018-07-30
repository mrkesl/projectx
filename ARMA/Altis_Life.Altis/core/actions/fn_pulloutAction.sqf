/*
 File: fn_pulloutAction.sqf
 Author: Bryan "Tonic" Boardwine
 
 Description:
 Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;
{
 if((side _x != west) OR ((player getVariable ["medic_level", 0]) > 0)) then
 {
  _x setVariable ["transporting",false,true];
  _x setVariable ["Escorting",false,true];
  detach _x;
  _x action ["Eject", vehicle _x];
 };
} foreach _crew;
