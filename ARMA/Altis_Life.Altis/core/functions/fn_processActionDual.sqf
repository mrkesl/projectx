/*
File: fn_processActionDual.sqf
Author: Bryan "Tonic" Boardwine //Fix by Creedcoder
Description:
Master handling for processing an item.
*/
params [["_vendor", ObjNull, [ObjNull]], ["_tmp", ObjNull, [ObjNull]], ["_tmp2", ObjNull, [ObjNull]], ["_type", "", [""]]];
private["_itemInfo","_oldItem1","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal1","_oldval2","_ui","_progress","_pgText","_cP","_speed"];
_speed = "medium";
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
if ((_type == "uranium2") && (life_inv_puranium == 0)) exitWith {hint "Du hast kein Produkt, um das Uran zu lösen";};
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing (percent) ..."
_itemInfo = switch (_type) do
{
case "uranium2": {["uranium2","puranium","uranium3",6000,"Legale Uran Auflösung"];};
case "uranium2b": {["uranium2","ipuranium","uranium3",6000,"Uran Auflösung"];};
default {[]};
};
//Error checking
if(count _itemInfo == 0) exitWith {};
//Setup vars.
_oldItem1 = _itemInfo select 0;
_oldItem2 = _itemInfo select 1;
_newItem = _itemInfo select 2;
_cost = _itemInfo select 3;
_upp = _itemInfo select 4;
//_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_hasLicense = ((([_type,0] call life_fnc_licenseType) select 0) in (player getVariable ["licenses",[]]));
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldName = [([_oldItem1,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldName2 = [([_oldItem2,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal1 = missionNamespace getVariable ([_oldItem1,0] call life_fnc_varHandle);
_oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle);
if(_oldVal1 <= _oldVal2) then {
 _oldVal = _oldVal1;
} else {
 _oldVal = _oldVal2;
};
_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};
if(_hasLicense) then {
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
life_is_processing = true;
while{true} do {
 sleep 0.25;
 _cP = _cP + 0.01;
 _progress progressSetPosition _cP;
 _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
 if(_cP >= 1) exitWith {};
 if(player distance _vendor > 10) exitWith {};
 };
 if(player distance _vendor > 10) exitWith {hint "Du musst in der nähe bleiben: 10m."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([false,_oldItem1,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([false,_oldItem2,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal] call life_fnc_handleInv; [true,_oldItem2,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
 5 cutText ["","PLAIN"];
 titleText[format["Du hast %1 zu %2 verarbeitet",_oldName,_itemName],"PLAIN"];
 life_is_processing = false;
} else {
 if((player getvariable["cash",0]) < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizenz zu verarbeiten!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
 while{true} do {
  sleep 0.5;
  _cP = _cP + 0.01;
  _progress progressSetPosition _cP;
  _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
  if(_cP >= 1) exitWith {};
  if(player distance _vendor > 10) exitWith {};
 };
 if(player distance _vendor > 10) exitWith {hint "Du musst in der nähe bleiben: 10m."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
 if((player getvariable["cash",0]) < _cost) exitWith {hint format["Du brauchst $%1 um ohne lizenz zu verarbeiten!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([false,_oldItem1,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([false,_oldItem2,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem1,_oldVal] call life_fnc_handleInv; [true,_oldItem2,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
 5 cutText ["","PLAIN"];
 titleText[format["Du hast %1 zu %2 zu $%3 verarbeitet",_oldName,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
 player setvariable["cash", (player getvariable["cash",0]) - _cost, true];
 life_is_processing = false;
};
