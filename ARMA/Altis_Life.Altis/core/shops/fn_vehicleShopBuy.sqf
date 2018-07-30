/*
File: fn_vehicleShopBuy.sqf
Author: Bryan "Tonic" Boardwine
Edit: Creedcoder
Description:
Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_side","_key","_plate","_tmp"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];
//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if((player getvariable["cash",0]) < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - (player getvariable["cash",0])] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};
_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
if((life_veh_shop select 0) == "med_air_hs") then {
  if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
  //Check if there is multiple spawn points and find a suitable spawnpoint.
  if(typeName _spawnPoints == typeName []) then {
    //Find an available spawn point.
    {if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
  } else {
    if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
  };
};
if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
player setvariable["cash", (player getvariable["cash",0]) - _basePrice, true];
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
//Spawn the vehicle and prep it.
if((life_veh_shop select 0) in ["med_air_hs"] or (life_veh_shop select 1) in ["cop_air_1"]) then {
  comment "spawn vehicle on server and wait for return";
  comment "condition, unit, classname, position";
  lar_global_var = objNull;
  [1, player, _className, [0,0,999]] remoteExecCall ["LAR_fnc_global",2];
  waitUntil{!isNull lar_global_var};
  //_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
  _vehicle = lar_global_var;
  waitUntil {!isNil "_vehicle"}; //Wait?
  lar_global_var = objNull;
  _vehicle setVariable["box",[0],true];
  if((life_veh_shop select 0) == "med_air_hs") then {
    _hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
    _vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
  } else {
    _vehicle setPosATL [3234.6,12874,10.1537];
    _vehicle setDir 12;
  };
  _vehicle setVelocity [0, 0, 0.1];
  _vehicle lock 2;
  [_vehicle,2] remoteExec ["life_fnc_lockVehicle", _vehicle, false];
  [_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle", 0, false];
  //[_vehicle] call life_fnc_clearVehicleAmmo;
  _vehicle setvariable["trunk_in_use", false, true];
  _vehicle setvariable["vehicle_info_owners", [[getPlayerUID player,profileName]], true];
  //_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
  _position = getMarkerPos _spawnPoint;
  lar_global_var = objNull;
  [1, player, _className, _position] remoteExecCall ["LAR_fnc_global",2];
  //_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
  waitUntil{!isNull lar_global_var};
  _vehicle = lar_global_var;
  waitUntil {!isNil "_vehicle"}; //Wait?
  lar_global_var = objNull;
  _vehicle lock 2;
  [_vehicle,2] remoteExec ["life_fnc_lockVehicle", _vehicle, false];
  _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
  _vehicle setDir (markerDir _spawnPoint);
  _vehicle setPos (getMarkerPos _spawnPoint);
  _vehicle setVelocity [0, 0, 0.1];
  [_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle", 0, false];
  //[_vehicle] call life_fnc_clearVehicleAmmo;
  _vehicle setvariable["trunk_in_use", false, true];
  _vehicle setvariable["vehicle_info_owners", [[getPlayerUID player,profileName]], true];
  //_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};
//Sets of animations
switch(_className)do{
  case "B_Heli_Light_01_F":{
    if(_colorIndex in [1,2,3,5,6,7,8,9,10,11,12])then {[_vehicle,"civ_littlebird",true]spawn life_fnc_vehicleAnimate;};
    if(_colorIndex in [0,1,4,13,14])then {[_vehicle,"other_littlebird",true]spawn life_fnc_vehicleAnimate;};
  };
  case "C_Offroad_01_F":{
    if(_colorIndex in [0])then{[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;_vehicle setVariable["xcar","cop_car",true];};
    if(_colorIndex in [1])then{[_vehicle,"Ucop_offroad",true] spawn life_fnc_vehicleAnimate;_vehicle setVariable["xcar","Ucop_car",true];};
    if(_colorIndex in [2])then{[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;_vehicle setVariable["xcar","med_car",true];};
    if(_colorIndex in [3])then{[_vehicle,"service_truck",true] spawn life_fnc_vehicleAnimate;_vehicle setVariable["xcar","aac_car",true];[1,_vehicle] remoteExec ["life_fnc_aac_vehicles", -2, false];};
    if(_colorIndex > 3 )then{/* nothing... maybe later? */};
  };
  case "C_SUV_01_F":{
    if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};
    if(_colorIndex in [1]) then{_vehicle setVariable["xcar","Ucop_car",true];};
    if(_colorIndex in [2]) then{_vehicle setVariable["xcar","med_car",true];};
  };
  case "I_Heli_light_03_unarmed_F":{
    if(_colorIndex in [0]) then{_vehicle setVariable["xcar","med_car",true];};
    if(_colorIndex in [1]) then{_vehicle setVariable["xcar","Ucop_car",true];};
  };
  case "C_Boat_Civil_01_police_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "C_Hatchback_01_sport_F":{if(_colorIndex in [6])then{_vehicle setVariable["xcar","cop_car",true];};};
  case "O_MRAP_02_F":{if(_colorIndex in [0])then{_vehicle setVariable["xcar","cop_car",true];};};
  case "B_MRAP_01_F":{if(_colorIndex in [0]) then {_vehicle setVariable["xcar","cop_car",true];};};
  case "I_Truck_02_covered_F":{if(_colorIndex in [2]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "I_MRAP_03_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "B_MRAP_01_hmg_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "O_APC_Wheeled_02_rcws_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "C_Van_01_box_F":{if(_colorIndex in [2]) then{_vehicle setVariable["xcar","med_car",true];};};
  case "C_Offroad_01_repair_F":{[_vehicle,"service_truck",true]spawn life_fnc_vehicleAnimate;_vehicle setVariable["xcar","aac_car",true];[1,_vehicle] remoteExec ["life_fnc_aac_vehicles", -2, false];};
  case "B_G_Offroad_01_repair_F":{[_vehicle,"service_truck",true]spawn life_fnc_vehicleAnimate;_vehicle setVariable["xcar","aac_car",true];[1,_vehicle] remoteExec ["life_fnc_aac_vehicles", -2, false];};
};

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;

//[getPlayerUID player,playerSide,_vehicle,1] remoteExec ["TON_fnc_keyManagement", 2, false];

if(_mode) then {
  if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {

    _side = switch(playerSide) do {
    	case west:{"cop"};
    	case civilian: {"civ"};
    	case independent: {"med"};
    	default {"Error"};
    };
    _plate = round(random(1000000));
    _key = format["%1_%2_%3", (getPlayerUID player), _side, _plate];

    _tmp = (player getvariable["vehicles",[]]);
    _tmp pushBack _key;
    player setvariable["vehicles", _tmp, true];

    [_key,_vehicle,_colorIndex] remoteExec ["TON_fnc_vehicleCreate", 2, false];
  };
};

//SAVE TO DO!!
[] spawn REDIS_fnc_save;
closeDialog 0; //Exit the menu.
true;
