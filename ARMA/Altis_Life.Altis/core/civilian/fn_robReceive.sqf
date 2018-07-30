/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
params [["_cash", 0, [0]]];
if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

player setvariable["cash", (player getvariable["cash",0]) + _cash, true];
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];