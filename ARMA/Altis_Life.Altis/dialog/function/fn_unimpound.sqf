#include <macro.h>
/*
 File: fn_unimpound.sqf
 Author: Bryan "Tonic" Boardwine
 Edit: Larvell & Creedcoder
 Description:
 Yeah... Gets the vehicle from the garage.
*/
private["_data","_vehicle","_unit","_price","_finished","_count","_pimp"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_data = (call compile format["%1",lbData[2802,(lbCurSel 2802)]]);
closeDialog 0;
_vehicle = _data select 0;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(life_garage_sp in ["car_pimpg_1","car_pimpg_2"]) then {
  _pimp = true;
  _price = [_vehicle,__GETC__(life_pimpgarage_prices)] call TON_fnc_index;
  if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_pimpgarage_prices) select _price) select 1;};
  if((player getvariable["bankacc",0]) < _price) then { breakto "lack_money"};
  if(typeName life_garage_sp == "ARRAY") then {
    [_data,(life_garage_sp select 0),_unit,_price,(life_garage_sp select 1)] remoteExec ["TON_fnc_spawnVehicle", 2, false];
  } else {
    if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3","cop_air_1"]) then {
      [_data,life_garage_sp,_unit,_price] remoteExec ["TON_fnc_spawnVehicle", 2, false];
    } else {
      [_data,(getMarkerPos life_garage_sp),_unit,_price,(markerDir life_garage_sp)] remoteExec ["TON_fnc_spawnVehicle", 2, false];
    };
  };
} else {
  _pimp = false;
  _price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
  if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
  if((player getvariable["bankacc",0]) < _price) then { breakto "lack_money"};
  if(typeName life_garage_sp == "ARRAY") then {
    [_data,life_garage_sp select 0,_unit,_price,(life_garage_sp select 1)] remoteExec ["TON_fnc_spawnVehicle", 2, false];
  } else {
      if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3","cop_air_1"]) then {
      [_data,life_garage_sp,_unit,_price] remoteExec ["TON_fnc_spawnVehicle", 2, false];
    } else {
      [_data,(getMarkerPos life_garage_sp),_unit,_price,(markerDir life_garage_sp)] remoteExec ["TON_fnc_spawnVehicle", 2, false];
    };
  };
};
hint localize "STR_Garage_SpawningVeh";
player setvariable["bankacc", (player getvariable["bankacc",0]) - _price, true];
if (_pimp) then {
    _count = {_x getvariable["onDuty", false]} count allPlayers;
    if(_count > 0) then {
      [round( _price / _count)] remoteExec ["life_fnc_aac_income", -2, false];
    };
};
_finished = 1;
if (_finished == 1) then { breakto "theend"} ;
scopeName "lack_money";
hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];
scopeName "theend";
