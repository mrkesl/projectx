/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
params [["_unit", ObjNull, [ObjNull]], ["_val", "", [""]], ["_from", Objnull, [Objnull]]];
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[(parseNumber (_val))] call life_fnc_numberText];
player setvariable["cash", (player getvariable["cash",0]) + (parseNumber(_val)), true];