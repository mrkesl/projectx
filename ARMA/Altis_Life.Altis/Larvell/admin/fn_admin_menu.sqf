/*
	Copyright © 2015 Creedcoder and Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
disableSerialization;
params[
  ["_condition", -1,[0]],
  ["_input", [], [[]]]
];
private["_display","_playerlist","_playerinfo","_cashvalue","_levelvalue","_vehiclelist","_admincashvalue","_playerselected","_info","_player","_vehiclelistIndex","_vehicleselected","_vehicleclass","_licences","_adminlevel"];
waitUntil {!isNull (findDisplay 18000)};
_display = findDisplay 18000;
_playerlist = _display displayCtrl 18001;
_playerinfo = _display displayCtrl 18002;
_cashvalue = parseNumber(ctrlText 18003);
_levelvalue = parseNumber(ctrlText 18004);
_vehiclelist = _display displayCtrl 18005;
_admincashvalue = parseNumber(ctrlText 18006);
_playerselected = lbData [18001,lbCurSel 18001];
_vehicleselected = lbData [18005,lbCurSel 18005];
_adminlevel = (player getVariable["admin_level",0]);


switch (_condition) do {
  case 0: {
    lbClear _playerlist;
    {
        _playerlistIndex = _playerlist lbAdd (name _x);
        _playerlist lbSetData [_playerlistIndex,netId _x];
    } forEach allPlayers;
    lbClear _vehiclelist;
    {
        _vehiclelistIndex = _vehiclelist lbAdd (getText (configFile >> "CfgVehicles" >> _x >> "displayName"));
        _vehiclelist lbSetData [_vehiclelistIndex, _x];
    } forEach admin_vehicles;
  };

  case 1: {
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Error: Menu bitte neu laden!"};
    _info = format["<t color='#FFFFFF'>UID: </t><t color='#ffff00'>%1</t><br/>", getPlayerUID _player];
    _info = _info + format["<t color='#FFFFFF'>Name: </t><t color='#ffff00'>%1</t><br/>", name _player];
    _info = _info + format["<t color='#FFFFFF'>Cash: </t><t color='#ffff00'>%1</t><br/>", [(_player getVariable["cash",0])] call life_fnc_numberText];
    _info = _info + format["<t color='#FFFFFF'>Bank: </t><t color='#ffff00'>%1</t><br/>", [(_player getVariable["bankacc",0])] call life_fnc_numberText];
    _info = _info + format["<t color='#FFFFFF'>Gang: </t><t color='#ffff00'>%1</t><br/>", (group _player) getVariable ["gang_name","Keine Gang!"]];
    if(side _player == west) then {
      _info = _info + format["<t color='#FFFFFF'>Cop Level: </t><t color='#ffff00'>%1</t><br/>", _player getVariable["cop_level",0]];
    };
    if(side _player == east) then {
      _info = _info + format["<t color='#FFFFFF'>Medic Level: </t><t color='#ffff00'>%1</t><br/>", _player getVariable["medic_level",0]];
    };
    if(side _player == civilian) then {
      _info = _info + format["<t color='#FFFFFF'>AAC Level: </t><t color='#ffff00'>%1</t><br/>", _player getVariable["aac_level",0]];
    };
    _info = _info + format["<t color='#FFFFFF'>Primaerwaffe: </t><t color='#ffff00'>%1</t><br/>", (getText (configFile >> "CfgWeapons" >> (primaryWeapon _player) >> "displayName"))];
    _info = _info + format["<t color='#FFFFFF'>Sekundaerwaffe: </t><t color='#ffff00'>%1</t><br/>", (getText (configFile >> "CfgWeapons" >> (secondaryWeapon _player) >> "displayName"))];
    _info = _info + format["<t color='#FFFFFF'>Backupwaffe: </t><t color='#ffff00'>%1</t><br/>", (getText (configFile >> "CfgWeapons" >> (handgunWeapon  _player) >> "displayName"))];
    _info = _info + format["<t color='#FFFFFF'>Lizenzen: </t><t color='#ffff00'>%1</t><br/>", _player getvariable["licenses", []]];
    _info = _info + format["<t color='#FFFFFF'>Fahrzeuge: </t><t color='#ffff00'>%1</t><br/>", count(_player getvariable["vehicles", []])];
    _info = _info + format["<t color='#FFFFFF'>Haeuser: </t><t color='#ffff00'>%1</t><br/>", count(_player getvariable["houses", []])];
    _playerinfo ctrlSetStructuredText parseText _info;
  };

  case 2: {
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {};
    if(_player == player) exitWith {hint "Du kannst dich nicht selber spectaten.";};

    [] spawn {
    	while {dialog} do {
    	closeDialog 0;
    	sleep 0.01;
    	};
    };

    _player switchCamera "INTERNAL";
    hint format["Du beobachtest gerade %1 \n\n Druecke F10 um den Spectator-Mode zu schliessen.",name _player];
    AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Du hast den Spectator-Mode geschlossen';};false"];
    ["Admin_Menu.log", format["%1 spectated %2!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 3: {
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {};
    if(_player == player) exitWith {hint "Du kannst dich nicht zu dir selbst teleportieren...";};
    vehicle player setPos [(getPos _player select 0) + floor(random 3), (getPos _player select 1) + floor(random 3), (getPos _player select 2)];
    hint format["Du hast dich zu %1 teleportiert.",name _player];
    ["Admin_Menu.log", format["%1 hat sich zu %2 teleportiert!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 4: {
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {};
    if(_player == player) exitWith {hint "Du kannst dich nicht zu dir selbst teleportieren...";};
    vehicle _player setPos [(getPos player select 0) + floor(random 3), (getPos player select 1) + floor(random 3), (getPos player select 2)];
    hint format["Du hast %1 zu dir teleportiert.", name _player];
    ["Admin_Menu.log", format["%1 hat %2 zu sich teleportiert!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 5: {
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _player setVariable["cash", (_player getVariable["cash",0]) + _cashvalue ,true];
    ["Admin_Menu.log", format["%1 gab %2 %3$!", profileName, name _player,[_cashvalue] call life_fnc_numberText]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 6: {
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _player setVariable["bankacc", (_player getVariable["bankacc",0]) + _cashvalue ,true];
    ["Admin_Menu.log", format["%1 ueberwiess %2 %3$!", profileName, name _player,[_cashvalue] call life_fnc_numberText]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 7: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _player setVariable["cop_level", _levelvalue ,true];
    hint format["%1 COP Level: %2", name _player, _levelvalue];
    ["Admin_Menu.log", format["%1 setzt %2's COP Level auf %3!", profileName, name _player,_levelvalue]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 8: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _player setVariable["medic_level", _levelvalue ,true];
    hint format["%1 MEDIC Level: %2", name _player, _levelvalue];
    ["Admin_Menu.log", format["%1 setzt %2's MEDIC Level auf %3!", profileName, name _player,_levelvalue]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 9: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _player setVariable["aac_level", _levelvalue ,true];
    hint format["%1 AAC Level: %2", name _player, _levelvalue];
    ["Admin_Menu.log", format["%1 setzt %2's AAC Level auf %3!", profileName, name _player,_levelvalue]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 10: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    player action ["gear", _player];
    ["Admin_Menu.log", format["%1 schaut sich %2's Gear an!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 11: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    hint format["Du hast %1 zurueck ins leben gefuehrt / geheilt.", name _player];
    [name player, true] remoteExec ["life_fnc_adminrevived", _player, false];
    _player setDamage 0;
    ["Admin_Menu.log", format["%1 hat %2 zurueck ins leben gefuehrt / geheilt!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 12: {
    if(_adminlevel < 1) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    [_player,false,15] remoteExec ["life_fnc_jail", _player, false];
    [0,format[(localize "STR_NOTF_Arrested_1"), name _player, profileName]] remoteExec ["life_fnc_broadcast", 0, false];
    ["Admin_Menu.log", format["%1 hat %2 ins Gefaengniss gesteckt!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 13: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    if(_player == player) exitWith {hint "Du kommst auf Ideen ;P";};
    [player] remoteExec ["life_fnc_freezePlayer", _player, false];
    ["Admin_Menu.log", format["%1 hat %2 gefreezed/unfreezed!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 14: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _vehicleclass = _vehicleselected;
    if(isNil "_vehicleclass") exitWith {hint "Bitte Fahrzeug auswaehlen!"};
    _vehicle = createVehicle [_vehicleclass, position player,[],0,"NONE"];
    //_vehicleclass createVehicle (position player);
    [_vehicle] call life_fnc_clearVehicleAmmo;
    hint format["%1 gespawnt!",(getText (configFile >> "CfgVehicles" >> _vehicleclass >> "displayName"))];
    ["Admin_Menu.log", format["%1 hat %2 gespawnt!", profileName, (getText (configFile >> "CfgVehicles" >> _vehicleclass >> "displayName"))]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 15: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    player setVariable["cash", _admincashvalue,true];
    ["Admin_Menu.log", format["%1 setzte seine Geldboerese auf %2$!", profileName, [_admincashvalue] call life_fnc_numberText]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 16: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    player setVariable["bankacc", _admincashvalue,true];
    ["Admin_Menu.log", format["%1 setzte seine Bankkonto auf %2$!", profileName, [_admincashvalue] call life_fnc_numberText]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 17: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _licences = switch (playerSide) do {
    	case (west): {
    		life_licenses select[0,3]
    	};
    	case (east): {
    		life_licenses select[3,1]
    	};
    	case (civilian): {
    		life_licenses select[4,30]
    	};
    };
    player setVariable["licenses", _licences, true];
    ["Admin_Menu.log", format["%1 gab sich alle Lizenzen!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
    [1] spawn life_fnc_admin_menu;
  };

  case 18: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    player spawn life_fnc_adm_g_loadout;
    ["Admin_Menu.log", format["%1 gab sich sein Loadout!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 19: {
    if(_adminlevel < 1) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    closeDialog 0;
    closeDialog 0;
    hint "Waehlen Sie den Ort aus, wo Sie gerne hinmoechten.";
    openMap [true, false];
    onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
    ["Admin_Menu.log", format["%1 hat sich teleportiert!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 21: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _save = [["Money",0],["Bank",50000],["Inventory",[]],["Houses",[]],["Vehicles",[]],["Admin",0],["Playtime",0],["Survival",[100,100]],["Jail",false],["Jail_Time",0],["Blacklist",false],["Gang",""],["Licenses",[]],["Contacts",[]],["Messages",[]],["CurrentWeapon",""],["Uniform","U_I_HeliPilotCoveralls"],["Vest",""],["Backpack","B_Bergen_mcamo"],["Goggles",""],["Headgear",""],["PrimaryWeapon",""],["SecondaryWeapon",""],["HandgunWeapon",""],["PrimaryWeaponItems",["","","",""]],["SecondaryWeaponItems",["","","",""]],["HandgunItems",["","","",""]],["AssignedItems",["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS"]],["UniformWeapons",[]],["UniformItems",[["FirstAidKit",2]]],["UniformMagazines",[]],["VestWeapons",[]],["VestItems",[]],["VestMagazines",[]],["BackpackWeapons",[]],["BackpackItems",[["Medikit",1]]],["BackpackMagazines",[]],["LoadedMagazines",[]],["Medi",1]];
    [format["%1_GUER",getPlayerUID _player], str _save, 0] remoteExec ["db_fnc_save", 2, false];
    hint "Profil erstellt!";
    ["Admin_Menu.log", format["%1 hat %2 ein Medic Profil erstellt!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 22: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    _player = objectFromNetId _playerselected;
    if(isNull _player) exitWith {hint "Kein Spieler ausgewaehlt!"};
    _save = [["Money",0],["Bank",50000],["Inventory",[]],["Houses",[]],["Vehicles",[]],["Admin",0],["Playtime",0],["Survival",[100,100]],["Jail",false],["Jail_Time",0],["Blacklist",false],["Gang",""],["Licenses",[]],["Contacts",[]],["Messages",[]],["CurrentWeapon",""],["Uniform","U_Rangemaster"],["Vest","V_Rangemaster_belt"],["Backpack",""],["Goggles","G_Tactical_Clear"],["Headgear","H_Cap_headphones"],["PrimaryWeapon",""],["SecondaryWeapon",""],["HandgunWeapon",""],["PrimaryWeaponItems",["","","",""]],["SecondaryWeaponItems",["","","",""]],["HandgunItems",["","","",""]],["AssignedItems",["ItemMap","ItemCompass","ItemWatch","ItemRadio"]],["UniformWeapons",[]],["UniformItems",[["FirstAidKit",1]]],["UniformMagazines",[]],["VestWeapons",[]],["VestItems",[]],["VestMagazines",[]],["BackpackWeapons",[]],["BackpackItems",[]],["BackpackMagazines",[]],["LoadedMagazines",[]],["Cop",1]];
    [format["%1_WEST",getPlayerUID _player], str _save, 0] remoteExec ["db_fnc_save", 2, false];
    hint "Profil erstellt!";
    ["Admin_Menu.log", format["%1 hat %2 ein Cop Profil erstellt!", profileName, name _player]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case 23: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    true spawn life_fnc_adm_gd_tg; //admin log in life_fnc_adm_gd_tg geschoben
  };

  case 24: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    true spawn life_fnc_car_gd_tg; //admin log in life_fnc_car_gd_tg geschoben
  };

  case 25: {
    if(_adminlevel < 2) exitWith {hint "Dein Admin Level ist zu niedrig!"};
    player spawn life_fnc_adminFreeze_all;
    ["Admin_Menu.log", format["%1 hat den Server gefreezed/unfreezed!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
  };

  case default {
    hint "Error";
  };
};
