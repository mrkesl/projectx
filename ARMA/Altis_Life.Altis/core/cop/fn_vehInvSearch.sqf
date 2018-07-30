#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,life_illegal_items] call TON_fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ([_var] call life_fnc_marketGetSellPrice));
		};
	};
} foreach (_vehicleInfo select 0);

if(_value > 0) then
{
	[0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", 0, false];
	player setvariable["bankacc", (player getvariable["bankacc",0]) + _value, true];
	_vehicle setVariable["Trunk",[],true];
}
	else
{
	hint localize "STR_Cop_NoIllegalVeh";
};