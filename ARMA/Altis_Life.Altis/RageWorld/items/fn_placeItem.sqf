/*
Author: Ragebone, Modified by Creedcoder
inspired by: http://www.altisliferpg.com/topic/7963-cant-use-item-problem/
forced walk etc will come...  
placing anim will come.. 
sound?
*/
private["_item","_itemType","_position","_pos","_var"];
if(life_action_inUse)exitWith{hint"Du bist beschäftigt";};
if(!life_onDuty && playerSide != west)exitWith{hint"Du bist kein Polizist oder nicht im Dienst des AAC.";};
if(life_pending)exitWith{hint"Du bist bereits dabei etwas aufzustellen."};
if(life_pendent)exitWith{hint"Du bist bereits dabei etwas aufzustellen."};
life_action_inUse = true;
_itemType = _this select 0;
_var = _this select 1;
_pos = getPosATL player;
[false,_var,1] call life_fnc_handleInv;
_item = _itemType createVehicle _pos;
_item attachTo[player,[0,5.5,0.2]];
_item setDir 180;
life_pendent = true;
_item setVariable["status","pending",true];
life_item = _item;
player setVariable ["Action_Aufstellen", player addAction[("<t color=""#E01B1B"">Aufstellen</t>"), {     // the fuck ?
life_item setVariable["status","deployed",true];
 detach life_item;
 life_item setPos [(getPos life_item select 0),(getPos life_item select 1),0];
 life_item allowDamage TRUE;
 life_item enableSimulation TRUE;
 life_item = ObjNull;
 life_action_inUse = false;
 life_pendent = false;
 player removeAction (player getVariable ["Action_Aufstellen", -1]);
 life_item = nil;
 _item = nil
}]];