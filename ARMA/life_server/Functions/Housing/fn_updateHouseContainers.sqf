/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Updates the storage for a house blah blah
*/
params [["_house", ObjNull, [ObjNull]]];
private["_houseID","_containers","_data"];
if(isNull _house) exitWith {systemChat "House null";};
_houseID = netId _house;

_containers = _house getVariable ["containers",[]];

_arr = [];
{
	_className = typeOf _x;
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;

	_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
} foreach _containers;

_data = [];
_data pushBack (_house getVariable ["house_owner",[]]);
_data pushBack (_house getVariable ["Trunk",[[],0]]);
_data pushBack _arr;
[_houseID, str _data, 2] spawn db_fnc_save;
