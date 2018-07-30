#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
params [["_shop", "", [""]]];
private["_return"];
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
		case "med_shop":
	{

		if((player getVariable ["medic_level", 0]) > 0) then
		{
			_return pushBack
			["C_Offroad_01_F",10000];
		};
		if((player getVariable ["medic_level", 0]) > 1) then
		{
			_return pushBack
			["C_Van_01_box_F",10000];
		};
	};
		case "med_air_hs":
	{

		if((player getVariable ["medic_level", 0]) > 1) then
		{
			_return pushBack
			["B_Heli_Light_01_F",50000];
		};
		if((player getVariable ["medic_level", 0]) > 2) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",60000];
		};
	};
	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",3000],
			["C_Hatchback_01_F",15000],
			["C_Offroad_01_F",23350],
			["C_SUV_01_F",24000],
			["C_Van_01_transport_F",80000],
			["C_Hatchback_01_sport_F",150000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",100000],
			["I_Truck_02_transport_F",145000],
			["I_Truck_02_covered_F",180000],
			/*["B_Truck_01_transport_F",200000],*/
			["B_Truck_01_ammo_F",800000],
			["O_Truck_03_transport_F",250000],
			["O_Truck_03_covered_F",550000],
			["B_Truck_01_box_F",1000000],
			["O_Truck_03_device_F",2000000],
			["O_Truck_03_ammo_F",900000],
			["C_Van_01_fuel_F",80000],
			["B_Truck_01_fuel_F",190000],
			["O_Truck_02_fuel_F",160000],
			["O_Truck_03_fuel_F",280000]
		];
	};
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",3000000],
			["B_Heli_Light_01_F",625000],
			["B_G_Offroad_01_armed_F",3750000]
		];
	};

	case "cop_car":
	{
		if(!ist_notstand) then {
			_return pushBack
			["C_Offroad_01_F",5000];
			_return pushBack
			["C_Hatchback_01_sport_F",10000];
			_return pushBack
			["C_SUV_01_F",20000];
			if((player getVariable ["cop_level", 0]) > 2) then
			{
				_return pushBack
				["B_MRAP_01_F",30000];
				_return pushBack
				["I_Truck_02_covered_F",25000];
			};
			if((player getVariable ["cop_level", 0]) > 4) then
			{
				_return pushBack
				["I_MRAP_03_F",40000];
			};
			if((player getVariable ["cop_level", 0]) > 7) then
			{
				_return pushBack
				["B_MRAP_01_hmg_F",80000];
				_return pushBack
				["O_APC_Wheeled_02_rcws_F",150000];
			};
		} else {
			_return pushBack
			["C_Offroad_01_F",5000];
			_return pushBack
			["C_Hatchback_01_sport_F",10000];
			_return pushBack
			["C_SUV_01_F",20000];
			if((player getVariable ["cop_level", 0]) > 2) then
			{
				_return pushBack
				["B_MRAP_01_F",30000];
				//_return pushBack
				//["I_Truck_02_covered_F",25000];
			};
			if((player getVariable ["cop_level", 0]) > 3) then
			{
				_return pushBack
				["I_MRAP_03_F",40000];
			};
			if((player getVariable ["cop_level", 0]) > 5) then
			{
				_return pushBack
				["B_MRAP_01_hmg_F",80000];
			};
			if((player getVariable ["cop_level", 0]) > 6) then
			{
				_return pushBack
				["O_APC_Wheeled_02_rcws_F",150000];
			};
		};
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",453000],
			["O_Heli_Light_02_unarmed_F",950000],
			["I_Heli_Transport_02_F",5000000]
		];
	};

	case "cop_air":
	{
		if(!ist_notstand) then {
			if((player getVariable ["cop_level", 0]) > 1) then
			{
				_return pushBack
				["B_Heli_Light_01_F",25000];
			};
			if((player getVariable ["cop_level", 0]) > 3) then
			{
				_return pushBack
				["I_Heli_light_03_unarmed_F",40000];
			};
			if((player getVariable ["cop_level", 0]) > 5) then
			{
				_return pushBack
				["B_Heli_Transport_01_F",70000];
			};
			if((player getVariable ["cop_level", 0]) > 6) then
			{
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",250000];
			};
		} else {
			if((player getVariable ["cop_level", 0]) > 0) then
			{
				_return pushBack
				["B_Heli_Light_01_F",25000];
			};
			if((player getVariable ["cop_level", 0]) > 2) then
			{
				_return pushBack
				["I_Heli_light_03_unarmed_F",40000];
			};
			if((player getVariable ["cop_level", 0]) > 5) then
			{
				_return pushBack
				["B_Heli_Transport_01_F",70000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",250000];
			};
		};
	};

	case "cop_airhq":
	{

		if((player getVariable ["cop_level", 0]) > 1) then
		{
			_return pushBack
			["B_Heli_Light_01_F",25000];
		};
		if((player getVariable ["cop_level", 0]) > 2) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",40000];
		};
		if((player getVariable ["cop_level", 0]) > 4) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",70000];
		};
		if((player getVariable ["cop_level", 0]) > 5) then
		{
			_return pushBack
			["B_Heli_Transport_03_unarmed_F",250000];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",120000]
		];
	};
	case "cop_ship":
	{
		_return =
		[
			["C_Boat_Civil_01_police_F",20000],
			["B_SDV_01_F",100000]
		];
	};
	case "aac_car":
	{
		if !(life_onDuty)exitWith{hint"Du bist nicht im Dienst.";};
		if((player getVariable ["aac_level", 0]) > 0) then{
		_return =
		[
			["C_Offroad_01_repair_F",3000],
			["B_Truck_01_transport_F",10000]
		];
	};
	};
	case "aac_air":
	{
		if !(life_onDuty)exitWith{hint"Du bist nicht im Dienst.";};
		if((player getVariable ["aac_level", 0]) > 0) then{
		_return =
		[
			["I_Heli_Transport_02_F",20000],
			["O_Heli_Transport_04_F",33000],
			["B_Heli_Transport_03_unarmed_F",50000]
		];
	};
	};
};

_return;
