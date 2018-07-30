/*
File: fn_processAction.sqf new
Author: Bryan "Tonic" Boardwine
edited by theInfinit (to process 2 Item to a combination)
re-edited by [midgetgrimm]
fixed by Creedcoder
Description:
Master handling for processing an item.
*/
params [["_vendor", objNull, [objNull]], ["_waffe", objNull, [objNull]], ["_tmp", objNull, [objNull]], ["_type", "", [""]]];
diag_log format["_vendor=%1, _waffe=%2, _tmp=%3, _type=%4",_vendor,_waffe,_tmp,_type];
private["_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2","_2var"];
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};
if (currentWeapon _waffe != "") exitWith { hint "Steck erstmal deine Waffe weg!" };
_error1 = false; // used below check the comment there ;)
_error2 = false;
//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ...",processing 2Items?, (only for processing with 2) second Item.
_itemInfo = switch (_type) do
{
 case "oil": {["oilu","oilp",12000,"Verarbeite Öl",false];};
 case "diamond": {["diamond","diamondc",13500,"Schleife Diamanten",false]};
 case "heroin": {["heroinu","heroinp",21000,"Verarbeite Heroin",false]};
 case "copper": {["copperore","copper_r",7500,"Verarbeite Kupfer",false]};
 case "iron": {["ironore","iron_r",11200,"Schmelze Eisen",false]};
 case "sand": {["sand","glass",6500,"Brenne Sand",false]};
 case "glassbottle":{["glass","bottles",6500,"Stelle Flaschen her",false]};//new
 case "salt": {["salt","salt_r",4500,"Verarbeite Salz",false]};
 case "cocaine": {["cocaine","cocainep",15000,"Verarbeite Kokain",false]};
 case "marijuana": {["cannabis","marijuana",5000,"Verarbeite Marijuana",false]};
 case "heroin": {["heroinu","heroinp",17200,"Verarbeite Heroin",false]};
 case "cement": {["rock","cement",3500,"Verarbeite Zement",false]};
 case "mash": {["water","mash",1000,"Stelle Maische her",true,"cornmeal"]};//new
 case "whiskey": {["yeast","whiskey",10000,"Fermentiere Whiskey",true,"rye"]};//new
 case "beer": {["yeast","beerp",15000,"Braue Bier",true,"hops"]};//new
 case "moonshine": {["yeast","moonshine",2500,"stelle Moonshine her",true,"mash"]};//new
 case "bottledshine": {["moonshine","bottledshine",5000,"Fülle Moonshine ab",true,"bottles"]};//new
 case "bottledbeer": {["beerp","bottledbeer",5000,"Fülle Bier ab",true,"bottles"]};//new
 case "bottledwhiskey": {["whiskey","bottledwhiskey",5000,"Fülle Whiskey ab",true,"bottles"]};//new
 case "uranium1":{["uranium1","uranium2",5000,"Uran Reinigen",false]};
 case "uranium4":{["uranium4","uranium",15000,"Uran Anreichern",false]};
 case "joint": {["marijuana","joint",250,"Rolle Joints",false]};
 case "wood": {["wood","woodc",250,"Stelle Bretter her.",false]};
 case "woodc": {["woodc","woodi",250,"Impregniere Holzbretter.",false]};

    default {[]};
};
//Error checking
if(count _itemInfo == 0) exitWith {};
//Setup vars.  // true if process action is with 2 Items and false if processing with 1 Item.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_2var = _itemInfo select 4;
if(_2var) then {
 _oldItem2 = _itemInfo select 5;
_oldName2 =[( [_oldItem2 ,0] call life_fnc_varHandle)] call life_fnc_varToStr;
};
if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
 _hasLicense = true;
 diag_log format ["process >>> _vendor in if case.... _haslicense = %1",_haslicense];
} else {
 _tmp = ([_type,0] call life_fnc_licenseType) select 0;
 _hasLicense = (_tmp in (player getVariable ["licenses", []]));
 diag_log format ["process >>> _vendor in else case.... _haslicense = %1",_haslicense];
};
_itemName =[( [_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldName =[( [_oldItem ,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);
//2vars
if(_2var) then { _oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle); };
if(_2var) then {
 if(_oldVal !=_oldVal2) then {
  if(_oldVal > _oldVal2) then {_error1 = true;};
  if(_oldVal2 > _oldVal) then {_error2 = true;};
 };
};
if(_error1) exitWith{hint format["Du hast zu viel %1, du brauchst gleiche Mengen",_oldName ];};
if(_error2) exitWith{hint format["Du hast zu viel %1, du brauchst gleiche Mengen",_oldName2 ];};
_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
if(_hasLicense) then {
life_is_processing = true;
while{true} do {
 sleep  0.5;
 _cP = _cP + 0.02;
 _progress progressSetPosition _cP;
 _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
 if(_cP >= 1) exitWith {};
 if(player distance _vendor > 10) exitWith {};
};
if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
//2vars
if(_2var) then {
 ([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
 5 cutText ["","PLAIN"];
 titleText[format["Du hast %1 und %2 in %3 verarbeitet.",_oldName ,_oldName2 ,_itemName],"PLAIN"];
} else {
 5 cutText ["","PLAIN"];
 titleText[format["Du hast %1 in %2 verarbeitet.",_oldName ,_itemName],"PLAIN"];
};
life_is_processing = false;
} else {
 if((player getvariable["cash",0]) < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizenz zu verarbeiten!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
 while{true} do {
  sleep  0.9;
  _cP = _cP + 0.02;
  _progress progressSetPosition _cP;
  _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
  if(_cP >= 1) exitWith {};
  if(player distance _vendor > 10) exitWith {};
 };
 if(player distance _vendor > 10) exitWith {hint "Du musst im Umkreis von 10m beim Verarbeiter bleiben."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
 if((player getvariable["cash",0]) < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizenz zu verarbeiten!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

 if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
 if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
 //2vars
 if(_2var) then {
  ([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
  5 cutText ["","PLAIN"];
  titleText[format["Du hast %1 und %2 in %3 für %4 verarbeitet.",_oldName ,_oldName2 ,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
 } else {
  5 cutText ["","PLAIN"];
  titleText[format["Du hast %1 in %2 für %3 verarbeitet.",_oldName ,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
 };
 player setvariable["cash", (player getvariable["cash",0]) - _cost, true];
 life_is_processing = false;
};
