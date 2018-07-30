private["_display","_list","_objects"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
    _display = findDisplay 3494;
    _list = _display displayCtrl 50002;
    lbClear _list;
	diag_log "vehsearch";
	found_vehicels = [];
    _objects = nearestObjects [player, ["Truck","Car"], 15];
    {
        if(vehicle player != _x) then {
			_color = [(typeOf _x),(_x getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
            _text = format["(%1)",_color];
            _list lbAdd format ["%1 - %2 (%3 m)", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"), _text, round(player distance _x)];
			found_vehicels set [count found_vehicels, _x];
        };
    } foreach _objects;
	
	diag_log format["found_vehicels (vehsearch): %1", found_vehicels];
};