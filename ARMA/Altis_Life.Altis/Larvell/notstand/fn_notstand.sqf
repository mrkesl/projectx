/*
	Copyright © 2015 Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
params [["_unit", objNull,[objNull]], ["_condition", 0,[0]]];
if(_unit == objNull) exitWith {};
if(_unit getvariable["cop_level", 0] < 2) exitWith {hint "Du bist nicht berechtigt den Notstand auszurufen.";};
switch (_condition) do
{
  case 0:
  {
    switch (ist_notstand) do
    {
      if(!allow_notstand) exitWith {};
      case false:
      {
        ist_notstand = true;
        publicvariable "ist_notstand";
        ["Achtung! Mit sofortiger Wirkung wird der Notstand ausgerufen!","Nationalgarde",10] remoteExec ["TON_fnc_clientMessage", allPlayers, false];
        ["notstand.log", format["%1 hat den Notstand ausgerufen.", name _unit]] remoteExec ["life_fnc_admin_log", 2, false];
        [] remoteExec ["life_fnc_notstand_aktiv", 0, true];
      };
      case true:
      {
        ist_notstand = false;
        publicvariable "ist_notstand";
        allow_notstand = false;
        publicvariable "allow_notstand";
        ["Achtung! Mit sofortiger Wirkung wird der Notstand aufgehoben. Die Freigabe den Notstand auszurufen wurde ebenfalls zurückgezogen.","Nationalgarde",10] remoteExec ["TON_fnc_clientMessage", allPlayers, false];
        ["notstand.log", format["%1 hat den Notstand aufgehoben.", name _unit]] remoteExec ["life_fnc_admin_log", 2, false];
      };
      default {hint "error in publicvariable ist_notstand";};
    };
  };
  case 1:
  {
    if(ist_notstand) exitWith {hint "Der Notstand wurde ausgerufen, die Freigabe kann nicht zurück gezogen werden.";};
    switch (allow_notstand) do
    {
      case false:
      {
        allow_notstand = true;
        publicvariable "allow_notstand";
        [format["Achtung! %1 hat mit sofortiger Wirkung die Freigabe erteilt den Notstand auszurufen!", name _unit],"Nationalgarde",11] remoteExec ["TON_fnc_clientMessage", west, false];
        ["notstand.log", format["%1 hat die Freigabe erteilt den Notstand auszurufen.", name _unit]] remoteExec ["life_fnc_admin_log", 2, false];
      };
      case true:
      {
        allow_notstand = false;
        publicvariable "allow_notstand";
        [format["Achtung! %1 hat mit sofortiger Wirkung die Freigabe den Notstand auszurufen zurückgezogen!", name _unit],"Nationalgarde",11] remoteExec ["TON_fnc_clientMessage", west, false];
        ["notstand.log", format["%1 hat die Freigabe den Notstand auszurufen zurueckgezogen.", name _unit]] remoteExec ["life_fnc_admin_log", 2, false];
      };
      default {hint "error in publicvariable allow_notstand";};
    };
  };
};
