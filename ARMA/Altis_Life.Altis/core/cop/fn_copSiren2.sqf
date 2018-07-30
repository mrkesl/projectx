/*
	File: fn_copSiren2.sqf
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
		siren2 = false;
	};
  case 1: {
		siren2 = true;
		while {siren2} do {
			if (!alive _vehicle || isNull _vehicle) exitWith {};
			_speedVeh = velocity  _vehicle;
			_speed = _speedVeh select 0;
			if (_speed < 100) then {
				if((vehicle player != player) && (cameraView == "INTERNAL") && (_vehicle distance player < 150)) then {
				_vehicle say2D "YelpS";
				} else {
				_vehicle say3D "YelpS";
				};
			} else {
				if((vehicle player != player) && (cameraView == "INTERNAL") && (_vehicle distance player < 150)) then {
				_vehicle say2D "YelpL";
				} else {
				_vehicle say3D "YelpL";
				};
			};
			uisleep 1.453;
		};
  };
};
