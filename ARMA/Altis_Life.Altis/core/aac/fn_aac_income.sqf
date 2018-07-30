/*
	@file Title: AAC Income by Creedcoder
	@file Version: 1.0
	@file Name: fn_aac_income.sqf
	@file Author: Creedcoder
	@file Edit: 28.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
if !(player getvariable["onDuty", false]) exitWith {};
params[
  ["_income",0,[0]]
];
player setvariable["bankacc", (player getvariable["bankacc",0]) + _income, true];
hint format["Du hast $%1 verdient durch die Verwahrstelle!",[_income] call life_fnc_numberText];
