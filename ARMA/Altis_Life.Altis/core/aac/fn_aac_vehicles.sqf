/*
	@file Title: AAC Vehicles Management by Creedcoder
	@file Version: 1.0
	@file Name: fn_aac_vehicles.sqf
	@file Author: Creedcoder
	@file Edit: 29.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
if(player getVariable ["aac_level", 0] < 1) exitWith {};

params[
  ["_switch",0,[0]],
  ["_vehicle",objNull,[objNull]]
];
switch (_switch) do {
    case 0: {
      {
        life_vehicles = [];
        if(_x getVariable["plate", ""] in (player getVariable ["vehicles", []])) then {
          life_vehicles pushBack _x;
        };
        nil;
      } count vehicles;
    };
    case 1: {
      if !(player getvariable["onDuty", false]) exitWith {};
      if(_vehicle != objNull) then {
        life_vehicles pushBack _vehicle;
      };
    };
};
