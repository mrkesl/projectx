/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.

	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
#define inarray(__val) (__val in (player getVariable ["licenses", []]))
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = inarray("civ_driver");};
	case "med_air_hs": {_ret = inarray("med_air");};
	case "civ_car": {_ret = inarray("civ_driver");};
	case "civ_ship": {_ret = inarray("civ_boat");};
	case "civ_air": {_ret = inarray("civ_air");};
	case "cop_air": {_ret = inarray("cop_air");};
	case "cop_airhq": {_ret = inarray("cop_air");};
	case "civ_truck":	{_ret = inarray("civ_truck");};
	case "reb_car": {_ret = inarray("civ_rebel");};
	case "cop_car": {_ret = true;};
	case "cop_ship": {_ret = inarray("cop_cg");};
	case "aac_car":{_ret = true;};
	case "aac_air":{_ret = true;};
};

_ret;
