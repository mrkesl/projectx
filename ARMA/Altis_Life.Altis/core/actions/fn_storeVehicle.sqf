/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: Tim & Larvell for Libra-Gaming

	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;

	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};
//_value = fuel _vehicle;
//hint format["%1",_value];
//[_value] remoteExec ["TIM_fnc_fuellevel", 2, false];
//_container = (nearestObjects [position player, ["Thing"], 200]) select 0;
//deleteVehicle _container;
[_vehicle,false,(_this select 1)] remoteExec ["TON_fnc_vehicleStore", 2, false];
{deleteVehicle _x;} foreach (attachedObjects _vehicle);
hint localize "STR_Garage_Store_Server";
life_garage_store = true;
