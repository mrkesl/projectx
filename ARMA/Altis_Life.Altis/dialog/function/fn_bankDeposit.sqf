/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint "Du kannst nicht mehr als $999,999 auf einmal einzahlen!";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > (player getvariable["cash",0])) exitWith {hint localize "STR_ATM_NotEnoughCash"};

player setvariable["cash", (player getvariable["cash",0]) - _value, true];
player setvariable["bankacc", (player getvariable["bankacc",0]) + _value, true];
[] spawn REDIS_fnc_save;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
