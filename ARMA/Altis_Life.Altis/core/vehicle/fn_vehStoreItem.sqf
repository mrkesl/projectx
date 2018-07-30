#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Du hast keine gültige Zahl eingegeben.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst keinen Wert unter 1 eingeben!";};


if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_getb = life_trunk_vehicle getVariable["box", false];
	
    if(_getb) then {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeightboxed;
	diag_log "mitbox";
	} else{
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
	diag_log "ohnebox";
	};
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Du kannst keine Goldbarren mit dem Helikopter transportieren!"};
if(_ctrl == "uranium1" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Du kannst keinen Radioaktivien Uranabfall mit dem Helikopter transportieren!"};
if(_ctrl == "uranium2" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Du kannst keinen Radioaktivien Uranabfall mit dem Helikopter transportieren!"};
if(_ctrl == "uranium3" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Du kannst keinen Radioaktivien Uranabfall mit dem Helikopter transportieren!"};
if(_ctrl == "uranium4" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Du kannst keinen Radioaktivien Uranabfall mit dem Helikopter transportieren!"};

_Truck = TypeOf life_trunk_vehicle;
_FuelStuff = ["oilu","oilp"]; //Wich Items can be stored in?
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F"]; //Fuel Trucks, who are allowed to carry fuel
switch (true) do
{
case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 3}; //NonFuel in FuelTruck -> Nope
case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};
if (life_TankLaster == 3) exitWith {hint "Du kannst nur Öl in einen Tanklaster füllen!)"};
if (life_TankLaster == 4) exitWith {hint "Du kannst Öl nur in einen Tanklaster füllen!)";};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if((player getvariable["cash",0]) < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	player setvariable["cash", (player getvariable["cash",0]) - _num, true];
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist voll oder kann nicht so viel transportieren."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
