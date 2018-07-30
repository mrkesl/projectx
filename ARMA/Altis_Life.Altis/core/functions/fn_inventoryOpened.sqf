/*
	@file Title: Inv Lock by Creedcoder
	@file Version: 1.0
	@file Name: fn_inventoryOpened.sqf
	@file Author: Creedcoder
	@file Edit: 28.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

*/
params ["_unit","_container"];
if(count _this == 1) exitWith {false};
if(!(_container getVariable ["gefesselt",false])) exitWith {
	_isPack = getNumber(configFile >> "CfgVehicles" >> (typeof _container) >> "isBackpack");
	if(_isPack == 1) exitWith {
			hint localize "STR_MISC_Backpack";
			true
	};
	false
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		true
	};
	false
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		true
	};
	false
};
