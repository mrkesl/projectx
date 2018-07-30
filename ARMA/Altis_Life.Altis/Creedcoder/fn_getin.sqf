/*
	@file Title: Tactical Offroad by Creedcoder
	@file Version: 1.0
	@file Name: fn_getin.sqf
	@file Author: Creedcoder
	@file Edit: 28.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
if(isServer) exitWith {};
params ["_vehicle"];
if(typeof _vehicle == "C_Offroad_01_F") exitWith {
  _vehicle addEventHandler ["GetIn", {
    params ["_vehicle","_position","_unit","_turret"];
    if(_position == "cargo" && (_turret select 0) >= 0) then {
      _unit switchmove "amovpsitmstpslowwrfldnon";
    };
  }];
  _vehicle addEventHandler ["SeatSwitched", {
    params ["_vehicle","_unit","_unit2"];
    assignedVehicleRole _unit params ["_position","_turret"];
    if(toLower _position == "cargo" && (_turret select 0) >= 0) then {
      _unit switchmove "amovpsitmstpslowwrfldnon";
    };
  }];
};
