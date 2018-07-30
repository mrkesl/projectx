/*
	File: fn_kabelbinderAction.sqf
	Author: Bryan "Tonic" Boardwine / Ragebone
	
	Description:
	Kabelbinds the target. ( zipties
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {hint"Er steht zu weit weg.";};
if((_unit getVariable "restrained")) exitWith {hint"Er ist bereits gefesselt.";};
if((_unit getVariable "Escorting")) exitWith {hint"Wird bereits bewegt.";};
if((_unit getVariable "escort")) exitWith {hint "bewegen...";};
if((_unit getVariable "gefesselt")) exitWith {hint"Er ist bereits gefesselt.";};
if((player getVariable "restrained")) exitWith {hint"Sie wurden gefesselt.";};
if((player getVariable "Escorting")) exitWith {hint"Sie werden bewegt.";};
if((player getVariable "transport")) exitWith {hint"Sie werden bewegt.";};
if((player getVariable "gefesselt")) exitWith {hint"Sie wurden mit Kabelbindern gefesselt.";};
if(life_isTazed) exitWith{hint"Sie wurden getazert.";};
if(life_knockout)exitWith{hint"Sie wurden K.O geschlagen.";};
if(player == _unit) exitWith {hint"Nicht auf dich selbst - Idiot!";};
if(!isPlayer _unit) exitWith {hint"Das funktioniert hier nicht.";};

life_inv_kabelbinder = life_inv_kabelbinder - 1;
//Broadcast!
_unit setVariable["gefesselt",true,true];
[player] remoteExec ["life_fnc_fessel", _unit, false];
hint "Die Kabelbinder sitzen! Fest, versteht sich!";