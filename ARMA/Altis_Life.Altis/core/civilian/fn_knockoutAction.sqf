/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
params [["_target", ObjNull, [ObjNull]]];

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExec ["life_fnc_animSync", 0, false];
sleep 0.08;
[_target,profileName] remoteExec ["life_fnc_knockedOut", _target, false];

sleep 3;
life_knockout = false;