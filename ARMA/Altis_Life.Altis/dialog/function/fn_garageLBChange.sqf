#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_retrievePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = _dataArr select 3;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_retrievePrice = [_className,__GETC__(life_garage_prices)] call TON_fnc_index;
_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices) select _retrievePrice) select 1;};


(getControl(2800,2803)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>$%1</t><br/>
	" +(localize "STR_Shop_Veh_UI_Color")+ " %7<br/>
	" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>
	" +(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>
	" +(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>
	" +(localize "STR_Shop_Veh_UI_Trunk")+ " %5<br/>
	" +(localize "STR_Shop_Veh_UI_Fuel")+ " %6
	",
[_retrievePrice] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
([_className,_vehicleColor] call life_fnc_vehicleColorStr)
];

ctrlShow [2803,true];
ctrlShow [2830,true];
