/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = (player getvariable["cash",0]) + _price;
[player,_vehicle,_price,_price2] remoteExec ["TON_fnc_chopShopSell", 2, false];
_msg = format[" Spieler: %1, Verkaufte: %2 für : %3 am Autoschieber. Er hat nun: %4",_playerName,_vehicle,_price,_price2];
[_msg] remoteExec ["TON_fnc_logIt", 2, false];
closeDialog 0;