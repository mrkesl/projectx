/*
	File: fn_animSync.sqf
*/
params [["_unit", ObjNull, [ObjNull]], ["_anim", "", [""]]];
if(isNull _unit) exitWith {};
_unit switchMove _anim;