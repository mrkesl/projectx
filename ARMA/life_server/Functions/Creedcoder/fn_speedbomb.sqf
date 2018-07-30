/*
	Copyright © 2015 Creedcoder, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

  _netid = netId cursorTarget;
  [_netid] remoteExec ["CC_fnc_speedbomb", 2, false];

*/
params[
  ["_netid", "",[""]]
];
if(_netid == "") exitWith {};
_veh = objectFromNetId _netid;
waitUntil {uisleep 0.5; (speed _veh > 25) && {isOnRoad _veh}};
_crew = crew _veh;
_crewcount = count _crew;
["Kennst du den Film Speed? Verlasse nicht die Straße! Fahrt nicht langsamer als 10km/h! Keiner verlässt das Fahrzeug!","Simon",0] remoteExec ["TON_fnc_clientMessage", _crew, false];
waitUntil {uisleep 0.5; !isOnRoad _veh || speed _veh < 10 || _crewcount != count (crew _veh)};
_alarm = createSoundSource ["Sound_Alarm", position _veh, [], 0];
_alarm attachTo [_veh];
uisleep 5;
deleteVehicle _alarm;
if!(surfaceIsWater position _veh || _veh getVariable["defused", false]) then {
	_veh setDamage 1;
} else {
	["Bombe entschärft! Diese Runde geht an dich...","Simon",0] remoteExec ["TON_fnc_clientMessage", _crew, false];
};
