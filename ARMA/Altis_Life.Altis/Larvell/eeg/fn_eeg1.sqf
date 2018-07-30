/*
	File: fn_eeg1.sqf
	Author: Larvell
	Description:
		checks stuff,
		starts the eeg sound.
*/
params [["_vehicle", ObjNull, [ObjNull]]];
if (isNull _vehicle) exitWith {};
if((vehicle player != player) && (cameraView == "INTERNAL") && (_vehicle distance player < 250)) then {
_vehicle say2D "eeg1";
} else {
_vehicle say3D "eeg1";
};
