/*
	Copyright © 2015 Creedcoder and Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
disableSerialization;
private["_display","_keyinsert"];
waitUntil {!isNull (findDisplay 18050)};
_display = findDisplay 18050;
_keyinsert = _display displayCtrl 18054;

_keyinsert ctrlSetText str _this;
