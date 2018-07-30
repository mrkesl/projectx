#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Deposits money into the players hand.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > (player getvariable["cash",0])) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

player setvariable["cash", (player getvariable["cash",0]) - _value, true];
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];
[] spawn REDIS_fnc_save;

hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmGangMenu;
[1,grpPlayer] remoteExec ["TON_fnc_updateGang", 2, false];
