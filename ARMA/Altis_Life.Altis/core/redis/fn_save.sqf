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
fnc_inventory = {
	_zItems = [];
	{
		_val = missionNameSpace getVariable _x;
		if(_val > 0) then {
			_zItems pushBack [_x,_val];
		};
	} forEach life_inv_items;
_zItems;
};
_uid = getPlayerUID player;
_data = [];
_data pushBack ["Name", profilename];
_data pushBack ["Money", player getVariable ["cash", 0]];
_data pushBack ["Bank", player getVariable ["bankacc", 0]];

_data pushBack ["Inventory", (call fnc_inventory)];

_data pushBack ["Houses", player getVariable ["houses",[]]];
_data pushBack ["Vehicles", player getVariable ["vehicles",[]]];

_data pushBack ["Admin", player getVariable ["admin_level", 0]];
_data pushBack ["Playtime", player getVariable ["playtime", 0]];
_data pushBack ["Survival", [(player getVariable ["hunger", 100]),(player getVariable ["thirst", 100])]];

_data pushBack ["Jail", player getVariable ["arrested", false]];
_data pushBack ["Jail_Time", player getVariable ["jail_time", 0]];

_data pushBack ["Blacklist", player getVariable ["blacklist", false]];

_data pushBack ["Gang", player getVariable ["gang", ""]];

_data pushBack ["Licenses", player getVariable ["licenses", []]];

_data pushBack ["Contacts", player getVariable ["mycontacts", []]];
_data pushBack ["Number", player getVariable ["mynumber", ""]];
_data pushBack ["Messages", player getVariable ["mymsgs", []]];

if (vehicle player == player) then {
_data pushBack ["CurrentWeapon", format ["%1", currentMuzzle player]];
};

_data pushBack ["Uniform", uniform player];
_data pushBack ["Vest", vest player];
_data pushBack ["Backpack", backpack player];
_data pushBack ["Goggles", goggles player];
_data pushBack ["Headgear", headgear player];

_data pushBack ["PrimaryWeapon", primaryWeapon player];
_data pushBack ["SecondaryWeapon", secondaryWeapon player];
_data pushBack ["HandgunWeapon", handgunWeapon player];

_data pushBack ["PrimaryWeaponItems", primaryWeaponItems player];
_data pushBack ["SecondaryWeaponItems", secondaryWeaponItems player];
_data pushBack ["HandgunItems", handgunItems player];

_data pushBack ["AssignedItems", assignedItems player];

_MagsUniform = [];
{
_mag = _x select 0;
_ammo = _x select 1;
if (_ammo > 0) then {
  _MagsUniform pushBack [_mag, 1, _ammo];
};
} forEach magazinesAmmoCargo uniformContainer player;
_MagsVest = [];
{
_mag = _x select 0;
_ammo = _x select 1;
if (_ammo > 0) then {
  _MagsVest pushBack [_mag, 1, _ammo];
};
} forEach magazinesAmmoCargo vestContainer player;
_MagsBackpack = [];
{
_mag = _x select 0;
_ammo = _x select 1;
if (_ammo > 0) then {
  _MagsBackpack pushBack [_mag, 1, _ammo];
};
} forEach magazinesAmmoCargo backpackContainer player;
_loadedMags = [];
{
_mag = _x select 0;
_ammo = _x select 1;
_loaded = _x select 2;
_type = _x select 3;
_location = _x select 4;

if (_loaded && _ammo > 0 && _type != 0) then {
  _loadedMags pushBack [_mag, _ammo];
};
} forEach magazinesAmmoFull player;

_data pushBack ["UniformWeapons", (getWeaponCargo uniformContainer player) call fnc_cargoToPairs];
_data pushBack ["UniformItems", (getItemCargo uniformContainer player) call fnc_cargoToPairs];
_data pushBack ["UniformMagazines", _MagsUniform];

_data pushBack ["VestWeapons", (getWeaponCargo vestContainer player) call fnc_cargoToPairs];
_data pushBack ["VestItems", (getItemCargo vestContainer player) call fnc_cargoToPairs];
_data pushBack ["VestMagazines", _MagsVest];

_data pushBack ["BackpackWeapons", (getWeaponCargo backpackContainer player) call fnc_cargoToPairs];
_data pushBack ["BackpackItems", (getItemCargo backpackContainer player) call fnc_cargoToPairs];
_data pushBack ["BackpackMagazines", _MagsBackpack];

_data pushBack ["LoadedMagazines", _loadedMags];

if(playerside == west) then {
_data pushBack ["Cop", player getVariable ["cop_level", 0]];
};
if(playerside == independent) then {
_data pushBack ["Medi", player getVariable ["medic_level", 0]];
};
if(playerside == civilian) then {
_data pushBack ["aac", player getVariable ["aac_level", 0]];
};

[format["%1_%2",_uid, str playerSide], str _data, 0] remoteExec ["db_fnc_save", 2, false];
