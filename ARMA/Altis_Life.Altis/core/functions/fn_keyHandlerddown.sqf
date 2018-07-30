/*
 File: fn_keyHandlerddown.sqf
 Author: Bryan "Tonic" Boardwine
 modified by Libra / Libra: Larvell

 Description:
 Main key handler for event 'keyDown'
*/

#include <macro.h>

private ["_handled","_shift","_alt","_code","_ctrl","_ctrlKey"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {true;};

if !(life_key_handle) then {
life_key_handle = true;
switch (_code) do{
  //Map Key
  case 50:{
   switch (playerSide) do{
     case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
     case independent: {if(!visibleMap) then {[] spawn life_fnc_teamMarkers;[] spawn life_fnc_medicMarkers;}};
     case civilian: {if(!visibleMap) then {[] spawn life_fnc_groupMarkers;}};
   };
  };
   //^ Entfernt
   case 41:{
     _handled = true;
   };
   case 59:{
     _handled = true;
   };
   case 60:{
     _handled = true;
   };
   case 61:{
     _handled = true;
   };
   case 62:{
     _handled = true;
   };
   case 63:{
     _handled = true;
   };
   case 64:{
     _handled = true;
   };
   case 65:{
     _handled = true;
   };
   case 66:{
     _handled = true;
   };
   case 67:{
     _handled = true;
   };
   case 68:{
     _handled = true;
   };
   case 87:{
     _handled = true;
   };
   case 88:{
     _handled = true;
   };
};
life_key_handle = false;
} else {
_handled = true;
};
_handled
