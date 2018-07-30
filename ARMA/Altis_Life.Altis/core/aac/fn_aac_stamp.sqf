/*
	@file Title: AAC Stamp in/out by Creedcoder
	@file Version: 1.0
	@file Name: fn_aac_stamp.sqf
	@file Author: Creedcoder
	@file Edit: 29.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
if(player getVariable ["aac_level", 0] < 1) exitWith {hint"Sie sind kein AAC Mitarbeiter!"};

if(life_onDuty) then {
	life_onDuty = FALSE;
	player setvariable["onDuty", false, true];
	hint "Sie haben ihre Schicht beendet.";
  [player] joinSilent oldgroup;
  [0] remoteExec ["life_fnc_aac_vehicles", -2, false];
} else {
  if({_x getvariable["onDuty", false]} count allPlayers > 0) then {
    {
      if(_x getvariable["onDuty", false]) exitWith {
        oldgroup = group player;
        [player] joinSilent _x;
      };
      nil;
    } count allPlayers;
  } else {
    oldgroup = group player;
    [player] joinSilent createGroup civilian;
  };
  life_onDuty = TRUE;
	player setvariable["onDuty", true, true];
	hint" Sie arbeiten jetzt für den AAC.";
	[] execVM "IgiLoad\IgiLoadInit.sqf";
};
