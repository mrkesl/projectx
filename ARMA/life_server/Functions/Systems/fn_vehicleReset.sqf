/*
	File: fn_vehicleReset.sqf
	Author: Creedcoder

	Description:
  Nix gibt's!
*/
_vehicleList = ["Index", 3] call db_fnc_load;
{
  [_x, 2, false, 3] spawn db_fnc_listset;
} forEach _vehicleList;
