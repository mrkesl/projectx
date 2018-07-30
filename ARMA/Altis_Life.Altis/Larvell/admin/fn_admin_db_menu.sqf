/*
	Copyright © 2015 Creedcoder and Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
disableSerialization;
params[
  ["_condition", -1,[0]]
];
private["_display","_sourcelist","_sourceselected","_keylist","_keyselected","_key","_keyinsert","_adminvalue","_disabledbuttons","_keylistIndex"];
waitUntil {!isNull (findDisplay 18050)};
_display = findDisplay 18050;

_sourcelist = _display displayCtrl 18051;
_sourceselected = lbData [18051,lbCurSel 18051];
_keylist = _display displayCtrl 18052;
_keyselected = lbData [18052,lbCurSel 18052];
_key = ctrlText 18053;
_keyinsert = _display displayCtrl 18054;
_disabledbuttons = [18056, 18057, 18058];

switch (_condition) do
{
  case 0: {
    if((player getVariable["admin_level",0]) < 3) then
      {
        {ctrlEnable [_x, false];} forEach _disabledbuttons;
      };
      lbClear _sourcelist;
  		_sourcelistIndex = _sourcelist lbAdd "Spieler";
  		_sourcelist lbSetData[_sourcelistIndex,"0"];
  		_sourcelistIndex = _sourcelist lbAdd "Gangs";
  		_sourcelist lbSetData[_sourcelistIndex,"1"];
      _sourcelistIndex = _sourcelist lbAdd "Häuser";
  		_sourcelist lbSetData[_sourcelistIndex,"2"];
  		_sourcelistIndex = _sourcelist lbAdd "Fahrzeuge";
  		_sourcelist lbSetData[_sourcelistIndex,"3"];
  		_sourcelist lbSetCurSel 0;
    hint "menu loaded, combobox filter created";
  };

  case 1: {
    lbClear _keylist;
    switch (_sourceselected) do {
        case "0": {
          {
            _tmp = format["%1_%2", getPlayerUID _x, side _x];
            _keylistIndex = _keylist lbAdd _tmp;
            _keylist lbSetData [_keylistIndex, _tmp];
          } forEach allPlayers;
        };

        case "1": {
          {
            _tmp = _x getVariable "gang_id";
            if(!isNil "_tmp") then {
              _keylistIndex = _keylist lbAdd _tmp;
              _keylist lbSetData [_keylistIndex, _tmp];
            };
          } forEach allGroups;
        };

        case "2": {
          ["Index", player, "life_fnc_admin_db_menu_list", false, 2] remoteExec ["db_fnc_load", 2, false];
        };

        case "3": {
          ["Index", player, "life_fnc_admin_db_menu_list", false, 3] remoteExec ["db_fnc_load", 2, false];
        };
    };
  };

  case 2: {
    ctrlSetText [18053,_keyselected];
    if(_sourceselected == "3") then {
      [_keyselected, player, "life_fnc_admin_db_menu_fill", false, parseNumber _sourceselected] remoteExec ["db_fnc_listload", 2, false];
    } else {
      [_keyselected, player, "life_fnc_admin_db_menu_fill", false, parseNumber _sourceselected] remoteExec ["db_fnc_load", 2, false];
    };
  };

  case 3: {
    if(_sourceselected == "3") then {
      [_key, player, "life_fnc_admin_db_menu_fill", false, parseNumber _sourceselected] remoteExec ["db_fnc_listload", 2, false];
    } else {
      [_key, player, "life_fnc_admin_db_menu_fill", false, parseNumber _sourceselected] remoteExec ["db_fnc_load", 2, false];
    };
  };

  case 4: {
    if(_sourceselected == "3") then {
      [_keyselected, parseNumber _sourceselected] remoteExec ["db_fnc_listdel", 2, false];
      uiSleep 5;
      [_keyselected, call compile (ctrlText _keyinsert), parseNumber _sourceselected] remoteExec ["db_fnc_listadd", 2, false];
    } else {
      [_keyselected, ctrlText _keyinsert, parseNumber _sourceselected] remoteExec ["db_fnc_save", 2, false];
    };
  };

  case 5: {
    {
      _tmp = format["%1_%2", getPlayerUID _x, side _x];
      if(_keyselected == _tmp) exitWith {
        [_keyselected, _x, "REDIS_fnc_load", false, 0] remoteExec ["db_fnc_load", 2, false];
      };
    } forEach allPlayers;
  };

  case default {
    hint "Error";
    closeDialog 0;
  };
};
