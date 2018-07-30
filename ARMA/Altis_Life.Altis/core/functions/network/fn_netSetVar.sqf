/*
	File: fn_netSetVar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Set a variable on a client.
*/
disableSerialization;
params [["_varName", "", [""]], ["_value", -9999, [sideUnknown,"",[],{},false,0,ObjNull,GrpNull,displayNull]], ["_ns", missionNamespace, [missionNamespace]]];
if(_varName == "") exitWith {}; //Error checking
_ns setVariable[_varName,_value];