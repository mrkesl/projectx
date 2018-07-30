/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by Mr.Sears aka Larvell

	Description:
	Starts and monitors the knocked out state.
*/
params [["_target", ObjNull, [ObjNull]], ["_who", "", [""]]];
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};
titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
private "_rag";
_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_rag setMass 1e10;
[_target] remoteExec ["life_fnc_knockSound", 0, false];
_rag attachTo [player, [0,0,0], "Spine3"];
_rag setVelocity [0,0,6];
player allowDamage false;
detach _rag;
0 = _rag spawn { deleteVehicle _this; player allowDamage true;};
player setVariable["robbed",FALSE,TRUE];
life_knockedout = true;
player setVariable ["knockedout", true, true];
sleep 9;
life_knockedout = false;
player setVariable ["knockedout", false, true];
