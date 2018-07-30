/*
	File: fn_simDisable.sqf
*/
params [["_obj", ObjNull, [ObjNull]], ["_bool", false, [false]], ["_from", Objnull, [Objnull]]];
if(isNull _obj) exitWith {};

_obj enableSimulation _bool;