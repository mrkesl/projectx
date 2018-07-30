#include <macro.h>
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "item_ad" && !(life_onDuty)) exitWith {hint "Du bist nicht im Dienst."};
if(_shop == "rebel" && playerSide != civilian) exitWith {hint "Na na na... was machst du da?"};
createDialog "shops_menu";

[] call life_fnc_virt_update;
