#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed", "_dbname"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
_dbname = _chrByte - [32];
_dbname = toString _dbname;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if((player getvariable["bankacc",0]) < (__GETC__(life_gangPrice))) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-(player getvariable["bankacc",0]))] call life_fnc_numberText];};
if(count life_gangData != 0) exitWith {hint "You are currently already active in a gang, please leave the gang first.";life_action_gangInUse = nil;}; //Dafuq?

[player,getPlayerUID player,_gangName,_dbname] remoteExec ["TON_fnc_insertGang", 2, false];

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;