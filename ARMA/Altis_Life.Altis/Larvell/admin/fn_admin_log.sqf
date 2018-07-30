/*
	Copyright © 2015 Creedcoder, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
if(!isServer) exitWith {};
params[
	["_file", "error.log",[""]],
  ["_msg", "error",[""]]
];
[_file, _msg, true] call db_fnc_log;
