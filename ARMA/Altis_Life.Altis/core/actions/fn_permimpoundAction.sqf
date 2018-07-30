/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Impounds the vehicle
*/
params [["_vehicle", objNull, [objNull]]];
private["_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP"];
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle;}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	if (player getvariable["onDuty", false]) then {
		[0,"STR_NOTF_DUTYBeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast", 0, false];
	} else {
		[0,"STR_NOTF_PERMBeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast", 0, false];
	};
	life_action_inUse = true;

	_upp = localize "STR_NOTF_PERMImpounding";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];

	if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_PERMImpoundingCancelled"; life_action_inUse = false;};
	if(!alive player) exitWith {life_action_inUse = false;};
	//_time = _vehicle getVariable "time";
	//if(isNil {_time}) exitWith {deleteVehicle _vehicle; hint "This vehicle was hacked in"};
	//if((time - _time)  < 120) exitWith {hint "This is a freshly spawned vehicle, you have no right impounding it."};
	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {life_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = (call life_impound_car);};
			case (_vehicle isKindOf "Ship"): {_price = (call life_impound_boat);};
			case (_vehicle isKindOf "Air"): {_price = (call life_impound_air);};
		};

		life_impound_inuse = true;
		[_vehicle,true,player,true] remoteExec ["TON_fnc_vehicleStore", 2, false];
		waitUntil {!life_impound_inuse};
		if (player getvariable["onDuty", false]) then {
			hint format["Du hast einen %1 verwahrt\n\nDanke für die Mitarbeit!",_type];
			[0,"STR_NOTF_PERMHasImpounded",true,[profileName,(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast", 0, false];
		} else {
			hint format[localize "STR_NOTF_PERMImpounded",_type,_price];
			[0,"STR_NOTF_PERMHasImpounded",true,[profileName,(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast", 0, false];
			player setvariable["bankacc", (player getvariable["bankacc",0]) + _price, true];
		};
	}
		else
	{
		hint localize "STR_NOTF_PERMImpoundingCancelled";
	};
};
life_action_inUse = false;
