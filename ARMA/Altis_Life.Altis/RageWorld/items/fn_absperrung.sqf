#include <macro.h>
/*
    File: fn_absperung.sqf
    Author: Ragebone
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map, und tut Zig anderes Zeug ihr bitches ! 
*/
private["_position","_absperung","_pos"];
if((player getVariable ["aac_level", 0]) < 1 OR playerSide != west)exitWith{ hint " SIE Sir sollen dies nicht benutzen ! "};
if(life_action_inUse)exitWith{};
life_action_inUse = true;
_pos = getPos player;
_absperung = "RoadBarrier_F" createVehicle _pos;
_absperung attachTo[player,[0,5.5,0.2]];
_absperung setDir 90;
_absperung setVariable["status","pending",true];

life_absperung = _absperung;
waitUntil {isNull life_absperung};
if(life_isNOT_pending)then{life_isNOT_pending = false};
waitUntil {life_isNOT_pending};
detach life_absperung;
life_absperung = ObjNull;
if(isNull _absperung) exitWith {life_absperung = ObjNull;};
_absperung setPos [(getPos _absperung select 0),(getPos _absperung select 1),0];
_absperung setVariable["status","deployed",true];
_absperung allowDamage false;
life_action_inUse = false;
