#include <macro.h>
#define inarray(__val) (__val in (player getVariable ["licenses", []]))
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
params [["_house", ObjNull, [ObjNull]]];
private["_uid","_action","_houseCfg","_netid"];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!(inarray("civ_home"))) exitWith {hint localize "STR_House_License"};
if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if((player getvariable["bankacc",0]) < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	_netid = netid _house;
	[_netid,[_uid,profileName]] remoteExec ["TON_fnc_addHouse",2,false];
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	player setvariable["bankacc", (player getvariable["bankacc",0]) - (_houseCfg select 0), true];
	life_vehicles pushBack _house;
	life_houses pushBack _house;
	_tmp = (player getvariable["houses",[]]);
	_tmp pushBack _netid;
	player setvariable["houses", _tmp, true];
	_marker = createMarkerLocal [format["house_%1",_netid],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
};

true spawn REDIS_fnc_save;
