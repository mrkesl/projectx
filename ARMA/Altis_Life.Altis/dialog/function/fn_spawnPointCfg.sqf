#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
params [["_side", civilian, [civilian]]];
private "_return";

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["copt_spawn","Trainingsgelände","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
		/*
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
		*/
	};

	case civilian:{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];

		if((player getVariable ["aac_level", 0]) > 0)then{
			_return = _return + [
				["aac_spawn_1","AAC Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["aac_spawn_2","AAC Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["aac_spawn_3","AAC Airport","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["aac_spawn_4","AAC Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["aac_spawn_5","AAC Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};

		if(count (player getvariable["houses",[]]) > 0) then {
			{
				_house = objectFromNetId _x;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				_return pushBack [format["house_%1", _x],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach (player getvariable["houses",[]]);
		};
	};

	case independent: {
		_return = [
			["medic_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
		/*
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};
		*/
	};
};

_return;
