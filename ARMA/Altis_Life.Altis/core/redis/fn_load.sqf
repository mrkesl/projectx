/*
	Copyright © 2015 Creedcoder, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
fnc_cargoToPairs = {
	private "_array";

	_array = [];
	if (count _this > 1) then {
		{
			_array pushBack [_x, (_this select 1) select _forEachIndex];
		} forEach (_this select 0);
	};
	_array
};

fnc_isWeaponType = {
	private ["_weapon", "_type", "_weaponType", "_typeHolder", "_typeBits", "_weaponTypeBits", "_result"];

	_weapon = _this select 0;
	_type = _this select 1;
	_weaponType = getNumber (configFile >> "CfgWeapons" >> _weapon >> "type");
	if (_type < 1 || _weaponType < 1) exitWith {false};
	_typeHolder = _type;
	_typeBits = [];
	while {_typeHolder > 0} do {
		_typeBits pushBack (_typeHolder % 2);
		_typeHolder = floor (_typeHolder / 2);
	};
	_typeHolder = _weaponType;
	_weaponTypeBits = [];

	while {_typeHolder > 0} do {
		_weaponTypeBits pushBack (_typeHolder % 2);
		_typeHolder = floor (_typeHolder / 2);
	};
	if (count _typeBits > count _weaponTypeBits) exitWith {false};
	_result = true;
	{
		if (_x == 1 && {_weaponTypeBits select _forEachIndex == 0}) exitWith
		{
			_result = false;
		};
	} forEach _typeBits;
	_result
};

fnc_isAssignableBinocular = {
	private ["_player", "_item", "_isAssignable"];

	_player = _this select 0;
	_item = _this select 1;
	_isAssignable = true;
	if ([_item, 4096] call fnc_isWeaponType && {getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") != 616}) then {
		{
			if ([_x, 4096] call fnc_isWeaponType && {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") != 616}) exitWith {
				_isAssignable = false;
			};
		} forEach assignedItems _player;
	} else {
		_isAssignable = false;
	};
	_isAssignable
};

_data = _this;

private ["_name", "_value"];

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

if(count _data == 0) exitwith {
	2 cutText ["No save found!", "PLAIN DOWN", 1];
	player setVariable ["cash", 0, true];
	player setVariable ["bankacc", 15000, true];
	[player] remoteExec ["life_fnc_generate_number", 2, false];
	switch (playerSide) do
	{
					case west:
					{
									_handle = [] spawn life_fnc_copLoadout;
									waitUntil {scriptDone _handle};
					};

					case civilian:
					{
									//Initialize Civilian Settings
									_handle = [] spawn life_fnc_civLoadout;
									waitUntil {scriptDone _handle};
					};

					case independent:
					{
									//Initialize Medics and blah
									_handle = [] spawn life_fnc_medicLoadout;
									waitUntil {scriptDone _handle};
					};
	};
	//Init Weiter Spawnen
	if(!redis_load) then {
  	true spawn life_client_init;
		redis_load = true;
	};
};

{
	_name = _x select 0;
	_value = _x select 1;

	switch (_name) do {

		case "Money": { player setVariable ["cash", _value, true] };
		case "Bank": { player setVariable ["bankacc", _value, true] };

		case "Inventory": {
						{
							_item = [(_x select 0),1] call life_fnc_varHandle;
							[true,_item,(_x select 1)] call life_fnc_handleInv;
						} foreach _value;
					};

		case "Houses": { player setVariable ["houses",_value, true];
						{
							_house = objectFromNetId _x;
							life_vehicles pushBack _house;
							life_houses pushBack _house;
						} foreach _value;
						[_value] remoteExec ["TON_fnc_fetchPlayerHouses", 2, false];
						[] spawn life_fnc_initHouses;
					};

		case "Vehicles": { player setVariable ["vehicles",_value, true];
						{
							if(_x getVariable["plate", ""] in (player getVariable ["vehicles", []])) then {
								life_vehicles pushBack _x;
							};
						} foreach vehicles;
					};

		case "Admin": { player setVariable ["admin_level", _value, true] };
		case "Playtime": { player setVariable ["playtime", _value, true] };
		case "Survival": { player setVariable ["hunger", (_value select 0), true]; player setVariable ["thirst", (_value select 1), true];};

		case "Jail": { player setVariable ["arrested", _value, true] };
		case "Jail_Time": { player setVariable ["jail_time", _value, true] };
		case "Blacklist": { player setVariable ["blacklist", _value, true] };

		case "Gang": { 	player setVariable ["gang", _value, true];
						[_value, player, "life_fnc_initGang", false, 1] remoteExec ["db_fnc_load", 2, false];
					};

		case "Licenses": { player setVariable ["licenses", _value, true] };

		case "Contacts": { player setVariable ["mycontacts", _value, true] };
		case "Number": { player setVariable ["mynumber", _value, true] };
		case "Messages": { player setVariable ["mymsgs", _value, true] };

		case "Cop": { player setVariable ["cop_level", _value, true] };
		case "Medi": { player setVariable ["medic_level", _value, true] };
		case "aac": { player setVariable ["aac_level", _value, true] };
		case "Soeldner": { player setVariable ["soeldner_level", _value, true] };

		case "Uniform":	{ player forceAddUniform _value; [_value] spawn life_fnc_texturesync;};
		case "Vest": { if (_value != "") then { player addVest _value } };
		case "Backpack": { if (_value != "") then { player addBackpack _value; [_value] spawn life_fnc_texturesync;} };
		case "Goggles": { if (_value != "") then { player addGoggles _value } };
		case "Headgear": {player addHeadgear _value;};
		case "LoadedMagazines": { { player addMagazine _x } forEach _value };
		case "PrimaryWeapon": { player addWeapon _value; removeAllPrimaryWeaponItems player };
		case "SecondaryWeapon": { player addWeapon _value };
		case "HandgunWeapon": { player addWeapon _value; removeAllHandgunItems player };
		case "PrimaryWeaponItems": { { if (_x != "") then { player addPrimaryWeaponItem _x } } forEach _value };
		case "SecondaryWeaponItems": { { if (_x != "") then { player addSecondaryWeaponItem _x } } forEach _value };
		case "HandgunItems": { { if (_x != "") then { player addHandgunItem _x } } forEach _value };
		case "AssignedItems":
		{
			{
				if ([player, _x] call fnc_isAssignableBinocular) then
				{
					player addWeapon _x;
				}
				else
				{
					player linkItem _x;
				};
			} forEach _value;
		};
		case "CurrentWeapon": { player selectWeapon _value };
		case "UniformWeapons": { { (uniformContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "UniformItems": { { (uniformContainer player) addItemCargoGlobal _x } forEach _value };
		case "UniformMagazines": { { (uniformContainer player) addMagazineAmmoCargo _x } forEach _value };
		case "VestWeapons": { { (vestContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "VestItems": { { (vestContainer player) addItemCargoGlobal _x } forEach _value };
		case "VestMagazines": { { (vestContainer player) addMagazineAmmoCargo _x } forEach _value };
		case "BackpackWeapons": { { (backpackContainer player) addWeaponCargoGlobal _x } forEach _value };
		case "BackpackItems": { { (backpackContainer player) addItemCargoGlobal _x } forEach _value };
		case "BackpackMagazines": { { (backpackContainer player) addMagazineAmmoCargo _x } forEach _value };
	};
} foreach _data;
if (needReload player == 1) then {reload player};
if(currentWeapon player != "") then {
 life_curWep_h = currentWeapon player;
 player action ["SwitchWeapon", player, player, 100];
};
if (player getVariable ["mynumber", ""] == "") then {
	[player] remoteExec ["life_fnc_generate_number", 2, false];
};

//Init Weiter Spawnen
if(!redis_load) then {
	true spawn life_client_init;
	redis_load = true;
};
