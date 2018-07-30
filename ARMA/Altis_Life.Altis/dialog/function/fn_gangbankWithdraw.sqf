#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Withdraws money of the players hand.
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
_gangcash = group player getVariable "gang_bank";

if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > _gangcash) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && _gangcash > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

player setvariable["cash", (player getvariable["cash",0]) + _val, true];
_gangcash = _gangcash - _val;
grpPlayer setVariable ["gang_bank",_gangcash,true];
[] spawn REDIS_fnc_save;

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmGangMenu;
[1,grpPlayer] remoteExec ["TON_fnc_updateGang", 2, false];
