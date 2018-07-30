/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls back information about the wanted criminal.
*/
params [
	["_data", [], [[]]]
];
private["_display","_list","_bounty","_mylist","_crime"];
disableSerialization;
_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_mylist = [];
if(typeName _data != "ARRAY") exitWith {hint "Failed to fetch crimes";};
if(count _data == 0) exitWith {hint "Failed to fetch crimes";};
lbClear _list;

_bounty = 0;
{
	_bounty = _bounty + (_x select 1);
} forEach _data;

{
	_crime = _x select 0;
	if(!(_crime in _mylist)) then	{
		_mylist pushBack _crime;
		_list lbAdd format["%1 mal %2",{_x select 0 == _crime} count _data,_crime];
	};
} foreach _data;

ctrlSetText[2403,format["Current Bounty Price: $%1",[_bounty] call life_fnc_numberText]];
