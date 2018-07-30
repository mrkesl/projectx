/*
	File: fn_copSiren1.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
		checks stuff,
		starts the siren.
*/
params [
	["_vehicle", ObjNull, [ObjNull]],
	["_switch", 0, [0]]
];
private["_speedVeh","_speed"];
if (isNull _vehicle) exitWith {};
switch (_switch) do {
	case 0: {
		siren1 = false;
	};
  case 1: {
		siren1 = true;
		while {siren1} do {
			if (!alive _vehicle || isNull _vehicle) exitWith {};
			_speedVeh = velocity  _vehicle;
			_speed = _speedVeh select 0;
			if (_speed < 100) then {
				if((vehicle player != player) && (cameraView == "INTERNAL") && (_vehicle distance player < 150)) then {
				_vehicle say2D "SirenLongS";
				} else {
				_vehicle say3D "SirenLongS";
				};
			} else {
				if((vehicle player != player) && (cameraView == "INTERNAL") && (_vehicle distance player < 150)) then {
				_vehicle say2D "SirenLongL";
				} else {
				_vehicle say3D "SirenLongL";
				};
			};
			uisleep 1.453;
		};
  };
};
