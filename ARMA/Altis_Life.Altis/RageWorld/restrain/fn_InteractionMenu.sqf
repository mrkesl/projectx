/*
	File: fn_InteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine / Ragebone
	
	Description:
	Replaces the mass addactions for various player actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401


private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
params [["_curTarget", Objnull, [Objnull]]];
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
_Btn9 = _display displayCtrl Btn9;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_entfessel; closeDialog 0;";

//Set Escort Button
if((_curTarget getVariable["transport",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopTransport; [life_pInact_curTarget] call life_fnc_InteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_TransportAction; closeDialog 0;";
};

_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_insFahrzeug;";



_Btn4 ctrlEnable false;
_Btn4 ctrlShow false;

_Btn5 ctrlEnable false;
_Btn5 ctrlShow false;

_Btn6 ctrlEnable false;
_Btn6 ctrlShow false;

_Btn7 ctrlEnable false;
_Btn7 ctrlShow false;

// Gear Button
_Btn8 ctrlSetText localize "STR_Open_Inv";
_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_opengear; closeDialog 0;";

_Btn9 ctrlEnable false;
_Btn9 ctrlShow false;

		