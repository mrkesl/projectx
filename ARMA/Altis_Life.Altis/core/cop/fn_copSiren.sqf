/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
		checks stuff,
		starts the durchsage.
*/
params [["_vehicle", ObjNull, [ObjNull]]];
if (isNull _vehicle) exitWith {};
if((vehicle player != player) && (cameraView == "INTERNAL") && (_vehicle distance player < 150)) then {
_vehicle say2D "Durchsage";
} else {
_vehicle say3D "Durchsage";
};
