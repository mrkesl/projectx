/*
	Copyright Â© 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
params [["_info", [], [[]]]];
private["_display","_list","_entry"];
disableSerialization;
_display = findDisplay 2400;
_list = _display displayctrl 2401;

{
	_entry = _x;
	_list lbAdd format["%1", _entry select 1];
	_list lbSetData [(lbSize _list)-1,str(_entry)];
} forEach _info;

ctrlSetText[2404,"Verbindung hergestellt."];
/*
if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Keine Straftaten";
};*/