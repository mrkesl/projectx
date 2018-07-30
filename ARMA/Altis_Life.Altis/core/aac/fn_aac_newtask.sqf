/*
	@file Title: AAC New Task by Creedcoder
	@file Version: 1.0
	@file Name: fn_aac_newtask.sqf
	@file Author: Creedcoder
	@file Edit: 29.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
if !(player getvariable["onDuty", false]) exitWith {};
params["_unit","_from","_msg","_pos"];
_id = str round(random 99999);
[_unit,
[("Dein AAC Auftrag: " + _id)],
[(_from + ": " + _msg + "<br/><br/><executeClose expression='[(""Dein AAC Auftrag: "" + " + str _id + "),""SUCCEEDED"",true] call BIS_fnc_taskSetState;[(""AAC Auftrag: "" + " + str _id + "),""SUCCEEDED"",true] call BIS_fnc_taskSetState;[(""Dein AAC Auftrag: "" + " + str _id + "),[(""Dein AAC Auftrag: "" + " + str _id + " + "" ist abgeschlossen!""),(""Dein AAC Auftrag: "" + " + str _id + "),(""Dein AAC Auftrag: "" + " + str _id + ")]] call bis_fnc_tasksetdescription;[(""AAC Auftrag: "" + " + str _id + "),[(""AAC Auftrag: "" + " + str _id + " + "" ist abgeschlossen!""),(""AAC Auftrag: "" + " + str _id + "),(""AAC Auftrag: "" + " + str _id + ")]] call bis_fnc_tasksetdescription'>Auftrag abschließen</executeClose>"),("Dein AAC Notruf: " + _id),("Dein AAC Notruf: " + _id)],
_pos,
1,
1,
true,
"repair"] call BIS_fnc_taskCreate;

[player,
[("AAC Auftrag: " + _id)],
[(_from + ": " + _msg + "<br/><br/><executeClose expression='[(""Dein AAC Auftrag: "" + " + str _id + "),""CANCELED"",true] call BIS_fnc_taskSetState;[(""AAC Auftrag: "" + " + str _id + "),""CANCELED"",true] call BIS_fnc_taskSetState;[(""Dein AAC Auftrag: "" + " + str _id + "),[(""Dein AAC Auftrag: "" + " + str _id + " + "" ist abgelehnt!""),(""Dein AAC Auftrag: "" + " + str _id + "),(""Dein AAC Auftrag: "" + " + str _id + ")]] call bis_fnc_tasksetdescription;[(""AAC Auftrag: "" + " + str _id + "),[(""AAC Auftrag: "" + " + str _id + " + "" ist abgelehnt!""),(""AAC Auftrag: "" + " + str _id + "),(""AAC Auftrag: "" + " + str _id + ")]] call bis_fnc_tasksetdescription'>Auftrag ablehen</executeClose>"),("AAC Auftrag: " + _id),("AAC Auftrag: " + _id)],
_pos,
0,
1,
true,
"repair"] call BIS_fnc_taskCreate;
