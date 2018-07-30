/*
  File: fn_spawnVehicle.sqf
  Author: Bryan "Tonic" Boardwine
  Edit: Creedcoder
  Description:
  Sends the query request to the database, if an array is returned then it creates
  the vehicle if it's not in use or dead.
*/

params[
  ["_data", [], [[]]],
  ["_sp", [], [[],""]],
  ["_unit", ObjNull, [ObjNull]],
  ["_price", 0, [0]],
  ["_dir", 0, [0]]
];
_data params[
  ["_className", "",[""]],
  ["_type", "", [""]],
  ["_active", true, [true]],
  ["_colorIndex", -1, [0]],
  ["_impound", false, [false]],
  ["_fuel", 1, [0]],
  ["_container", "", [""]],
  ["_key", "", [""]]
];
private ["_pid", "_nearVehicles", "_db", "_vehicle", "_hs"];
_pid = getPlayerUID _unit;
_name = name _unit;

if(count _data == 0) exitWith {};
if(_key in serv_sv_use) exitWith {};
serv_sv_use pushBack _key;

if(typeName _sp != "STRING") then {
  _nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
  _nearVehicles = [];
};
if(count _nearVehicles > 0) exitWith {
  serv_sv_use = serv_sv_use - [_key];
  [_price,_unit] remoteExec ["life_fnc_garageRefund", _unit, false];
  [1,(localize "STR_Garage_SpawnPointError")] remoteExec ["life_fnc_broadcast", _unit, false];
};

_db = 3; //Vehicle
[_key, 2, true, _db] spawn db_fnc_listset; //active true
[_key, 4, false, _db] spawn db_fnc_listset; //Impound false

if(typeName _sp == "STRING") then {
  _vehicle = createVehicle [_className,[0,0,999],[],0,"NONE"];
  waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
  _vehicle allowDamage false;
  if(_sp == "cop_air_1") then {
    _vehicle setPosATL [3234.6,12874,10.1537];
    _vehicle setDir 12;
    _vehicle setVelocity [0, 0, 0.1];
  } else {
    _hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
    _vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
    _vehicle setVelocity [0, 0, 0.1];
  };
  sleep 0.6;
} else {
  _vehicle = createVehicle [_className,_sp,[],0,"NONE"];
  waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
  _vehicle allowDamage false;
  _vehicle setPos _sp;
  _vehicle setVectorUp (surfaceNormal _sp);
  _vehicle setDir _dir;
  _vehicle setVelocity [0, 0, 0.1];
};

_vehicle setfuel _fuel;

if(_container != "") then{
_container = createVehicle [_container, [0,0,99], [], 0, "CAN_COLLIDE"];
switch(_className)do{
	case "C_Van_01_transport_F":	{_container attachTo [_vehicle,[0,-1.1,0]];};
	case "C_Offroad_01_F":			{_container attachTo [_vehicle,[0,-1,0]];};
	case "I_Truck_02_transport_F":	{_container attachTo [_vehicle,[0.02,0.4,0]];};
	case "O_Truck_03_transport_F":	{_container attachTo [_vehicle,[0.06,-0.7,0]];};
};

_vehicle setVariable["box",true,true];
_container setVariable ["Trunk",nil, true];
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
} else {
  _vehicle setVariable["box",false,true];
};
//Creedcoder Redis Cleanup
_vehicle addMPEventHandler ["mpKilled",{
	if(isServer) then {
		_this spawn TON_fnc_vehicleDead;
	} else {
		_vehicles = player getVariable["vehicles",[]];
		_vehicles deleteAt (_vehicles find ((_this select 0) getVariable["plate",""]));
		player setVariable["vehicles",_vehicles, true];
	};
}];
_vehicle addMPEventHandler ["mpKilled",{{deleteVehicle _x; diag_log format["delete box _x=%1",_x];} foreach (attachedObjects (_this select 0));}];

//Send keys over the network.
[_vehicle] remoteExec ["life_fnc_addVehicle2Chain", _unit, false];

_vehicle lock 2;
//Reskin the vehicle
[_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle", 0, false];
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];

_vehicle setVariable["plate", _key, true];
_vehicle setVariable["discar",false];

[_vehicle] call life_fnc_clearVehicleAmmo;

//Sets of animations
switch(_className)do{
  case "B_Heli_Light_01_F":{
    if(_colorIndex in [1,2,3,5,6,7,8,9,10,11,12])then {[_vehicle,"civ_littlebird",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];};
    if(_colorIndex in [0,1,4,13,14])then {[_vehicle,"other_littlebird",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];};
  };
  case "C_Offroad_01_F":{
    if(_colorIndex in [0])then{[_vehicle,"cop_offroad",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];_vehicle setVariable["xcar","cop_car",true];};
    if(_colorIndex in [1])then{[_vehicle,"Ucop_offroad",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];_vehicle setVariable["xcar","Ucop_car",true];};
    if(_colorIndex in [2])then{[_vehicle,"med_offroad",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];_vehicle setVariable["xcar","med_car",true];};
    if(_colorIndex in [3])then{[_vehicle,"service_truck",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];_vehicle setVariable["xcar","aac_car",true];};
    if(_colorIndex > 3 )then{/*nothing right now, maybe later? */};
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
  case "C_Boat_Civil_01_police_F":{if(_colorIndex in [0])then{_vehicle setVariable["xcar","cop_car",true];};};
  case "C_Hatchback_01_sport_F":{if(_colorIndex in [6])then{_vehicle setVariable["xcar","cop_car",true];};};
  case "O_MRAP_02_F":{if(_colorIndex in [0])then{_vehicle setVariable["xcar","cop_car",true];};};
  case "B_MRAP_01_F":{if(_colorIndex in [0]) then {_vehicle setVariable["xcar","cop_car",true];};};
  case "I_MRAP_03_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "B_MRAP_01_hmg_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "O_APC_Wheeled_02_rcws_F":{if(_colorIndex in [0]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "I_Truck_02_covered_F":{if(_colorIndex in [2]) then{_vehicle setVariable["xcar","cop_car",true];};};
  case "C_Van_01_box_F":{if(_colorIndex in [2]) then{_vehicle setVariable["xcar","med_car",true];};};
  case "C_Offroad_01_repair_F":{[_vehicle,"service_truck",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];_vehicle setVariable["xcar","aac_car",true];};
  case "B_G_Offroad_01_repair_F":{[_vehicle,"service_truck",true] remoteExec ["life_fnc_vehicleAnimate", _unit, false];_vehicle setVariable["xcar","aac_car",true];};
};

[1,"Dein Fahrzeug wurde ausgeparkt!"] remoteExec ["life_fnc_broadcast", _unit, false];
serv_sv_use = serv_sv_use - [_key];
sleep 3;
_vehicle allowDamage true;
[_vehicle] remoteExec ["life_fnc_getin", 0, true];
