/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private["_deleted"];
_deleted = false;
while {true} do {
	private["_veh","_units"];
	sleep (60 * 60);
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then {
			_key = _veh getVariable["plate",""];
			_units = {(_x distance _veh < 300)} count playableUnits;
			_fuellevel = fuel _veh;

			if(count crew _x == 0) then	{
				switch (true) do {
					case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case (_units == 0): {deleteVehicle _x; _deleted = true;};
				};
			};

			if(_deleted) then {
				waitUntil {isNull _veh};
				_deleted = false;
			};

			if(isNull _veh) then {
				if(_key != "") then {
					_db = 3; //Vehicle
					[_key, 2, false, _db] spawn db_fnc_listset; //active false
					[_key, 5, _fuellevel, _db] spawn db_fnc_listset; //fuel save
				};
			};
		};
	} foreach vehicles;

	sleep (3 * 60); //3 minute cool-down before next cycle.
	{
		if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then
		{
			deleteVehicle _x;
		};
	} foreach (allMissionObjects "Thing");

};
