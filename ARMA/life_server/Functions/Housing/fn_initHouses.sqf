/*
	Author: Bryan "Tonic" Boardwine

	Description:

*/
private["_housesids","_housedata"];
_housesids = ["Index", 2] call db_fnc_load;
{
	_housedata = [_x, 2] call db_fnc_load;
	_house = objectFromNetId _x;
	_house setVariable["house_owner",(_housedata select 0),true];
	_house setVariable["locked",true,true]; //Lock up all the stuff.
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
} foreach _housesids;
