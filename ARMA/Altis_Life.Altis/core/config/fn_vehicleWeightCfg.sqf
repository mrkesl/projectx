/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
params [["_className", "", [""]]];

switch (_className) do
{
	case "C_Offroad_01_F": {60};
	case "C_Van_01_transport_F": {90};
	case "I_Truck_02_transport_F": {180};
	case "O_Truck_03_transport_F": {300};

	case "B_G_Offroad_01_F": {60};
	case "B_Quadbike_01_F": {25};
	case "I_Truck_02_covered_F": {230};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {40};
	case "C_SUV_01_F": {45};
	case "I_G_Van_01_transport_F": {90};
	case "C_Van_01_box_F": {120};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_Truck_01_box_F": {500};
	case "B_Truck_01_transport_F": {250};
	case "B_MRAP_01_F": {65};
	case "B_MRAP_01_hmg_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {60};
	case "O_APC_Wheeled_02_rcws_F": {120};
	case "B_Heli_Light_01_F": {50};
	case "O_Heli_Light_02_unarmed_F": {90};
	case "I_Heli_Transport_02_F": {250};
	case "C_Rubberboat": {85};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "O_Truck_03_covered_F": {350};
	case "O_Truck_03_device_F": {350};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	case "O_Truck_03_ammo_F": {450};
	case "B_Truck_01_ammo_F": {400};
	case "B_Truck_01_covered_F": {320};
	case "C_Van_01_fuel_F": {200};
	case "B_Truck_01_fuel_F": {300};
	case "O_Truck_02_fuel_F": {250};
	case "O_Truck_03_fuel_F": {500};
	case "CargoNet_01_box_F": {100};
	// gibt es schon muss noch angepatt werden! case "B_supplyCrate_F": {20};
	//case "Box_IND_AmmoVeh_F": {20};
	default {-1};
};
