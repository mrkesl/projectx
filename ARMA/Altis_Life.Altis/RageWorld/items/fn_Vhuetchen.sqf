#include <macro.h>
/*
    File: fn_absperung.sqf
    Author: Ragebone
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map, und tut Zig anderes Zeug ihr bitches ! 
*/
private["_huetchen","_pos"];
if(((player getVariable ["aac_level", 0]) < 1) OR playerSide != west)exitWith{ hint " SIE Sir sollen dies nicht benutzen ! ";};
if(life_action_inUse)exitWith{};
life_action_inUse = true;
life_pendent = True;
_pos = getPos player;
_huetchen = "RoadCone_L_F" createVehicle _pos;
_huetchen attachTo[player,[0,5.5,0.2]];
_huetchen setDir 90;
_huetchen setVariable["status","pending",true];

life_huetchen = _huetchen;
waitUntil {isNull life_huetchen};
if(life_isNOT_pending)then{life_isNOT_pending = false};
waitUntil {life_isNOT_pending};
life_pendent = false;
detach life_huetchen;
life_huetchen = ObjNull;
if(isNull _huetchen) exitWith {life_absperung = ObjNull;};
_huetchen setPos [(getPos _huetchen select 0),(getPos _huetchen select 1),0];
_huetchen setVariable["status","deployed",true];
_huetchen allowDamage false;
life_action_inUse = False;