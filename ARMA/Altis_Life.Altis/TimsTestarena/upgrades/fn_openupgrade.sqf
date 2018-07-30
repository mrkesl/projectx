if(!alive player || dialog) exitWith {};
createDialog "VehUpgrades";	
disableSerialization;
waitUntil {!isNull (findDisplay 3494)};
diag_log "openupgrade";
[] spawn life_fnc_vehsearch;