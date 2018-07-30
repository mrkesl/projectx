/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Cleans up containers inside the house.
*/
params [
	["_housesids",[],[[]]]
];

if(count _housesids == 0) exitWith {};
{
	_house = objectFromNetId _x;

	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
		_house setVariable["containers",nil,true];
	};
} foreach _housesids;
