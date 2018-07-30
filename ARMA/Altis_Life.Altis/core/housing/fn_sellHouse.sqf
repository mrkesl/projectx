#include <macro.h>
#define fnfind(__var1,__var2) (__var1 find __var2)
#define arraydel(__array,__item) __array deleteAt fnfind(__array,__item);
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Sells the house?
*/
params [["_house", ObjNull, [ObjNull]]];
private["_uid","_action","_houseCfg"];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "Dieses Haus gehört niemandem."};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_netid = netid _house;
	[_netid] remoteExec ["TON_fnc_sellHouse", 2, false];
	_house setVariable["house_owner",nil,true];
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["containers",nil,true];
	_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
	_containers = nearestObjects[(getPosATL _house),["Box_IND_Grenades_F","B_supplyCrate_F"],_radius];
	{deleteVehicle _x} foreach _containers;
	deleteMarkerLocal format["house_%1",_netid];

	player setvariable["bankacc", (player getvariable["bankacc",0]) + (round((_houseCfg select 0)/2)), true];
	arraydel(life_vehicles,_house)
	arraydel(life_houses,_house)

	_tmp = player getVariable["houses",[]];
	_tmp deleteAt (_tmp find _netid);
	player setVariable["houses",_tmp, true];

	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
};

true spawn REDIS_fnc_save;
