/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > (player getvariable["bankacc",0])) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && (player getvariable["bankacc",0]) > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

player setvariable["cash", (player getvariable["cash",0]) + _val, true];
player setvariable["bankacc", (player getvariable["bankacc",0]) - _val, true];
[] spawn REDIS_fnc_save;

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
