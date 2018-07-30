/*
	File: fn_InteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
        Modified by Tim

	Description:
	Replaces the mass addactions for various player actions towards another player.
*/
#define Btn1 37450
#define Title 37401

private["_display","_object","_Btn1"];
if(!dialog) then {
	createDialog "pUpgrade_Menu";
};
disableSerialization;

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;

//life_pInact_curTarget = _curTarget;

//Add box to car
_Btn1 ctrlSetText localize "Test";
_Btn1 buttonSetAction "_object = (nearestObjects [position player, [""Car"",""Truck""], 15]) select 0; [_object, _uid] call life_fnc_addbox; closeDialog 0;";

		