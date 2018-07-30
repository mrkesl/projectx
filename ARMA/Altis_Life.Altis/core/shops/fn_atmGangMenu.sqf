#include <macro.h>
/*
	File: fn_atmGangMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: Larvell
	
	Description:
	Opens and manages the bank menu.
	Mod: gang menu version
*/
private["_display","_text","_gangowner","_unit"];
if(isNil {(grpPlayer getVariable "gang_bank")}) exitWith {"Du bist in keiner Gang."};
_gangcash = group player getVariable "gang_bank";
_gangowner = group player getVariable "gang_owner";
_unit = getplayeruid player;
if(!(_gangowner == _unit)) exitWith {"Du bist nicht der Anführer der Gang."};

if(!life_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_gang_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;

_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[_gangcash] call life_fnc_numberText,[(player getvariable["cash",0])] call life_fnc_numberText];