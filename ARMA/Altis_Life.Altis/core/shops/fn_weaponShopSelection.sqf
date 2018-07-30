#include <macro.h>
/*
	File: fn_weaponShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks the weapon & adds the price tag.
*/
params [["_control", controlNull, [controlNull]], ["_index", -1, [0]]];
private["_priceTag","_price","_item"];
if(isNull _control OR _index == -1) exitWith {closeDialog 0;}; //Bad data

_priceTag = ((findDisplay 38400) displayCtrl 38404);
_item = _control lbData _index;
if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	_iS = [_item,__GETC__(life_weapon_shop_array)] call TON_fnc_index;
	if(_iS == -1) then 
	{
		_price = 0;
	}
		else
	{
		_price = (__GETC__(life_weapon_shop_array) select _iS) select 1;
	};
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
	_control lbSetValue[_index,_price];
}
	else
{
	_price = _control lbValue _index;
	if(_price > (player getvariable["cash",0])) then
	{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#ff0000'>$%1</t><br/>Es fehlen: <t color='#8cff9b'>$%2</t></t>",[(_price)] call life_fnc_numberText,[(_price - (player getvariable["cash",0]))] call life_fnc_numberText];
	}
		else
	{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
	};
};