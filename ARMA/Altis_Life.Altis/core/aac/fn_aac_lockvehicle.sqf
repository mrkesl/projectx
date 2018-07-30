/*
	@file Title: AAC Vehicle Driver Lock by Creedcoder
	@file Version: 1.0
	@file Name: fn_aac_vehicles.sqf
	@file Author: Creedcoder
	@file Edit: 30.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
params[
  ["_vehicle",objNull,[objNull]]
];
if(_vehicle == objNull) exitWith {};
if(lockedDriver _vehicle) then {
  _vehicle lockDriver false;
} else {
  _vehicle lockDriver true;
};
