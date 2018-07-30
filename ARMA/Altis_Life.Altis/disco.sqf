/*
	Copyright © 2015 Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
private ["_pos","_time","_discosound"];
_pos = getMarkerPos "Bar";
_discosound = "Helper_Base_F" createVehiclelocal _pos;
_time = 0;
while {true} do {
  _time = time + 3.75;
  _discosound say3D "disco";
  waitUntil{time >= _time};
  _time = 0;
};
