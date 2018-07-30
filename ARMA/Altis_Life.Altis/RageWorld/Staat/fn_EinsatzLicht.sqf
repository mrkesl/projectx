/*
Filename : fn_EinsatzLicht.sqf
Author : Ragebone
Description : Handhabt alles was mit den einsatzlichtern zutun hat.

*/
private["_type","_veh","_state"];
_veh = vehicle player;
if(_veh == player) exitWith {};
if(isNil {_veh getVariable"xcar"})exitWith{};     
if(!alive _veh) exitWith {};
if(isNull _veh) exitWith {}; 

//if(!(typeOf _veh in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","O_MRAP_02_F"])) exitWith {}; 

if(isNil{_veh getVariable"lights"})then{_veh setVariable["lights",false,true];};
_type = _veh getVariable"xcar";
_state = _veh getVariable"lights"; 
if(_state) then {
	_veh setVariable["lights",FALSE,TRUE];
} else {
	_veh setVariable["lights",TRUE,TRUE];
	switch(_type)do{
		case "cop_car":{[_veh,0.22] remoteExec ["life_fnc_copLights", 0, false];};		
		case "Ucop_car":{[_veh,0.22] remoteExec ["life_fnc_UcopLights", 0, false];};			
		case "med_car":{[_veh,0.22] remoteExec ["life_fnc_medicLights", 0, false];};		
		case "aac_car":{[_veh,0.22] remoteExec ["life_fnc_aacLights", 0, false];};	
	};
};