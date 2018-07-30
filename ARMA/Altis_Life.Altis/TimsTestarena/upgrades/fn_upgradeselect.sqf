private["_counter","_vehicle","_vehupinfos"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	_counter = lbCurSel (50002);
	if(_counter != -1) then{
	_vehupinfos = lbData [50003,lbcursel 50003];
	if(_vehupinfos != "Upgrade") exitWith { hint "Kein Upgrade ausgewählt";};
	_test = found_vehicels;
	_vehicle = found_vehicels select _counter;
	
	if(isNull _vehicle) exitWith {};
	
	diag_log format["VehSelect (upgradeselect): %1", _vehicle];
	diag_log format["Counter (upgradeselect): %1", _counter];
	diag_log format["_test (upgradeselect): %1", _test];
	[_vehicle] call life_fnc_addbox;
	closeDialog 0;	
	} else{
	hint "Du hast kein Fahrzeug ausgewählt";
	};
};

		