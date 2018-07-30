/*
	File: fn_InteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine / Ragebone
	
	Description:
	sets a specific time for the player who is on the way to jail.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401


private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
params [["_curTarget", ObjNull, [ObjNull]]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target


_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_pInact_curTarget = _this select 0;

//Set Unrestrain Button
_Btn1 ctrlSetText "10 Min";
_Btn1 buttonSetAction "[life_pInact_curTarget,10] call life_fnc_arrestAction; closeDialog 0";

_Btn2 ctrlSetText "15 Min";
_Btn2 buttonSetAction "[life_pInact_curTarget,15] call life_fnc_arrestAction; closeDialog 0;";

_Btn3 ctrlSetText "20 Min";
_Btn3 buttonSetAction "[life_pInact_curTarget,20] call life_fnc_arrestAction; closeDialog 0;";

_Btn4 ctrlSetText "30 Min";
_Btn4 buttonSetAction "[life_pInact_curTarget,30] call life_fnc_arrestAction; closeDialog 0;";

_Btn5 ctrlSetText "40 Min";
_Btn5 buttonSetAction "[life_pInact_curTarget,40] call life_fnc_arrestAction; closeDialog 0;";

_Btn6 ctrlSetText "50 Min";
_Btn6 buttonSetAction "[life_pInact_curTarget,50] call life_fnc_arrestAction; closeDialog 0;";

_Btn7 ctrlSetText "60 Min";
_Btn7 buttonSetAction "[life_pInact_curTarget,60] call life_fnc_arrestAction; closeDialog 0;";

_Btn8 ctrlSetText "1 1/2 Stunden";
_Btn8 buttonSetAction "[life_pInact_curTarget,90] call life_fnc_arrestAction; closeDialog 0;";		