/*
	Copyright © 2015 Larvell, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*/
private ["_posarray","_alarmarray","_time"];
_posarray = [[3251.08,12957.2,18.017],[3724.7,12983.5,15.5007],[14178.1,16331.4,18.00142479], [12841,16667.5,18.000976563], [16155.6,16036.2,18.0014925], [16575.4,12779.3,18.160115], [23506.2,19937.4,18.280467], [25655.5,21177.6,18.275446], [13860,18977.3,18.141527], [17533.5,13182.3,18.00147343], [14585.9,16918.2,18.00143433], [9277.93,15862.3,18.00137329], [18339.5,12236.2,18.00166321], [8979.2,12116.2,18.00115967], [26723.4,24585.2,18.00137329]];
_alarmarray = [];
{
  _tmp = createVehicle ["Helper_Base_F", _x, [], 0, "NONE"];
  _alarmarray pushBack _tmp;
  nil;
} count _posarray;
_time = 0;
while {ist_notstand} do {
  if(time > _time) then {
    {
      _x say3D "notstand";
      nil;
    } count _alarmarray;
    _time = time + 120;
  };
  uiSleep 5;
};
{
  deleteVehicle _x;
  nil;
} count _alarmarray;
