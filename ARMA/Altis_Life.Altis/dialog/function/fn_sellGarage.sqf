#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
if(life_action_inUse) exitWith{}; // prevent duping
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
life_action_inUse = true; // duping fix
_price = [_vehicle,__GETC__(life_garage_sell)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

[_vid,_pid,_price,player,life_garage_type] remoteExec ["TON_fnc_vehicleDelete", 2, false];
hint format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
player setvariable["bankacc", (player getvariable["bankacc",0]) + _price, true];
closeDialog 0;
sleep 5;
life_action_inUse = false; // duping fix