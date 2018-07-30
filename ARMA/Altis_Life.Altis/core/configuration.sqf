#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Variables *****
*****************************
*/
life_redgull_ammount = 0;
life_onDuty = false; // igiload
life_isSuicide = false;   // suicide Bombjacket
life_pendent = false ;    // stuff
life_pending = false; // stuff
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = ObjNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_hit_explosive = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_knockedout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_drink = 0;
player setVariable ["playtime", 0, true];
life_net_dropped = false;
life_bank_fail = false;
life_use_atm = true;
life_smartphoneTarget = ObjNull; // Smartphone
player setVariable ["arrested", false, true];
life_delivery_in_progress = false;
life_action_in_use = false;
player setvariable["thirst", 100, true];
player setvariable["hunger", 100, true];
player setvariable["cash", 0, true];
life_istazed = false;
life_my_gang = ObjNull;
life_vehicles = [];
bank_robber = [];
life_frozen = false; //added for Adminmenu
nn_last_vehicles = [];
nn_empInUse = false;
life_keyStrocke= false;
life_request_timer = false;
life_TankLaster = 1;
lar_has_god = 0;
lar_veh_god = 0;
found_vehicels = [];
life_key_handle = false;
lar_global_var = objNull;
change_number_value = 0;
life_houses = [];
redis_load = false;
siren1 = false;
siren2 = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,10000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,1500000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,100000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,3.5); //BLAH

__CONST__(life_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

__CONST__(life_impound_car,5000);
__CONST__(life_impound_boat,5500);
__CONST__(life_impound_air,10000);
/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F","O_Heli_Transport_04_F","B_Heli_Transport_03_unarmed_F","O_APC_Wheeled_02_rcws_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	// gold  http://www.altisliferpg.com/topic/4686-howto-dynamic-gold-spawnshunting/
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
	//http://www.altisliferpg.com/topic/4769-how-toalcohol-with-multiple-item-processingdrunk-effects-passouts-and-police-breathalyzing/
	"life_inv_cornmeal",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_moonshine",
	"life_inv_mash",
	//Rage stuff
	"life_inv_kabelbinder",
	"life_inv_absperrung",
	"life_inv_strahler",
	"life_inv_pole",
	"life_inv_tapesign",
	"life_inv_huetchen",
	"life_inv_battery",
	"life_inv_puranium",
	"life_inv_ipuranium",
	"life_inv_uranium1",
	"life_inv_uranium2",
	"life_inv_uranium3",
	"life_inv_uranium4",
	"life_inv_uranium",
	"life_inv_joint",
	"life_inv_pflasche",
	"life_inv_spritze",
	"life_inv_fisch",
	"life_inv_dirt",
	"life_inv_papier",
	"life_inv_ptuete",
	"life_inv_stiefel",
	"life_inv_ssenkel",
	"life_inv_hoffnung",
	"life_inv_glasflasche",
	"life_inv_bolzen",
	"life_inv_gschaft",
	"life_inv_feder",
	"life_inv_spulver",
	"life_inv_abzug",
	"life_inv_glauf",
	"life_inv_vhalterung",
	"life_inv_schrauben",
	"life_inv_plauf",
	"life_inv_schmuck",
	"life_inv_sfetzen",
	"life_inv_nadel",
	"life_inv_gfaden",
	"life_inv_rfaden",
	"life_inv_ofaden",
	"life_inv_sfaden",
	"life_inv_cstoff",
	"life_inv_rsfetzen",
	"life_inv_bsfetzen",
	"life_inv_blynx1",
	"life_inv_blynx2",
	"life_inv_blynx3",
	"life_inv_blrr1",
	"life_inv_blrr2",
	"life_inv_btitan1",
	"life_inv_btitan2",
	"life_inv_bzafir",
	"life_inv_npren",
	"life_inv_sflasche",
	"life_inv_axe",
	"life_inv_wood",
	"life_inv_woodc",
	"life_inv_woodi",
	"life_inv_pat",
	"life_inv_al",
	"life_inv_patg",
	"life_inv_fuelPipe",
	"life_inv_speedbomb"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	"cop_air",
	"cop_swat",
	"cop_cg",
	"med_air",
	"civ_driver",
	"civ_air",
	"civ_heroin",
	"civ_marijuana",
	"civ_gang",
	"civ_boat",
	"civ_oil",
	"civ_dive",
	"civ_truck",
	"civ_gun",
	"civ_rebel",
	"civ_coke",
	"civ_diamond",
	"civ_copper",
	"civ_iron",
	"civ_sand",
	"civ_salt",
	"civ_cement",
	"civ_home",
	"civ_liquor",
	"civ_stiller",
	"civ_bottler",
	"civ_uranium",
	"civ_joint",
	"civ_wood"
];

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["cannabis",1000],["turtle",3000],["ipuranium",150],["uranium",4000],["blastingcharge",10000],["boltcutter",500],["joint",80]];

//	Sell / buy arrays  Obsolete thanks to ekonomy
sell_array =
[
 ["apple",50],
 ["heroinu",1850],
 ["heroinp",2650],
 ["salema",45],
 ["ornate",40],
 ["mackerel",175],
 ["tuna",700],
 ["mullet",250],
 ["catshark",300],
 ["rabbit",65],
 ["oilp",3200],
 ["turtle",3000],
 ["water",5],
 ["coffee",5],
 ["turtlesoup",1000],
 ["donuts",60],
 ["marijuana",2350],
 ["cannabis",1000],
 ["tbacon",25],
 ["lockpick",75],
 ["pickaxe",750],
 ["redgull",200],
 ["peach",55],
 ["cocaine",3000],
 ["cocainep",5000],
 ["diamond",750],
 ["diamondc",2000],
 ["iron_r",3200],
 ["copper_r",1500],
 ["salt_r",1650],
 ["glass",1450],
 ["fuelF",500],
 ["spikeStrip",1200],
 ["cement",1950],
 ["goldbar",95000],
 ["goldbarp",105000],
 ["cornmeal",200],
 ["absperrung",500],
 ["huetchen",500],
 ["strahler",500],
 ["pole",500],
 ["tapesign",500],
 ["kabelbinder",1000],
 ["underwatercharge",2500],
 ["battery",750],
 ["uranium",35000],
 ["joint",80],
 ["schmuck",8000],
 ["axe",750],
 ["wood",1000],
 ["woodc",1000],
 ["woodi",2000],
 ["pflasche",100],
 ["fuelPipe",100],
 ["schmuck",25000],
 ["speedbomb",1000000]

];
__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["cornmeal",1200],
	["absperrung",1000],
	["huetchen",1000],
	["strahler",1000],
	["pole",1000],
	["tapesign",1000],
	["kabelbinder",15000],
	["underwatercharge",60000],
	["coffee",25],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["fuelE",450],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["battery",1500],
	["puranium",2000], //Legale Uranauflösung
	["ipuranium",150], //Illegale Uranauflösung
	["axe",750],
	/*["wood",500],
	["woodc",1000],
	["woodi",2000],*/
	["fuelPipe",900],
	["speedbomb",2000000]
];
__CONST__(buy_array,buy_array);

// ist der Verkaufswert.
life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",1000],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",5000],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",30000],
	["I_Truck_02_covered_F",30000],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_ammo_F",50000],
	["O_Truck_03_transport_F",50000],
	["O_Truck_03_covered_F",65000],
	["B_Truck_01_box_F", 30000],
	["O_Truck_03_device_F",100000],
	["B_Truck_01_fuel_F",20000],
	["O_Truck_02_fuel_F",30000],
	["O_Truck_03_fuel_F",40000],
	["O_MRAP_02_F",45000],
	["O_Truck_03_ammo_F",80000],
	["B_Heli_Light_01_F",45000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",15000],
	["I_MRAP_03_F",18000],
	["B_MRAP_01_hmg_F",800000],
	["O_APC_Wheeled_02_rcws_F",100000]
];
__CONST__(life_garage_prices,life_garage_prices);

if(playerSide == west) then {
	life_pimpgarage_prices = [
		["C_Offroad_01_F",2500],
		["C_Hatchback_01_sport_F",5000],
		["C_SUV_01_F",10000],
		["B_MRAP_01_F",15000],
		["I_Truck_02_covered_F",12500],
		["I_MRAP_03_F",20000],
		["B_MRAP_01_hmg_F",40000],
		["O_APC_Wheeled_02_rcws_F",75000],
		["B_Heli_Transport_01_F",35000],
		["B_Heli_Transport_03_unarmed_F",125000]
	];
} else {
	life_pimpgarage_prices = [
		["B_QuadBike_01_F",1000],
		["C_Hatchback_01_F",1500],
		["C_Offroad_01_F", 2500],
		["B_G_Offroad_01_F",5500],
		["C_SUV_01_F",10000],
		["C_Van_01_transport_F",60000],
		["C_Hatchback_01_sport_F",50000],
		["C_Van_01_fuel_F",4500],
		["I_Heli_Transport_02_F",100000],
		["C_Van_01_box_F",9000],
		["I_Truck_02_transport_F",300000],
		["I_Truck_02_covered_F",300000],
		["B_Truck_01_transport_F",256500],
		["B_Truck_01_ammo_F",500000],
		["O_Truck_03_transport_F",500000],
		["O_Truck_03_covered_F",650000],
		["B_Truck_01_box_F", 300000],
		["O_Truck_03_device_F",1000000],
		["B_Truck_01_fuel_F",200000],
		["O_Truck_02_fuel_F",300000],
		["O_Truck_03_fuel_F",400000],
		["O_MRAP_02_F",450000],
		["O_Truck_03_ammo_F",800000],
		["B_Heli_Light_01_F",45000],
		["O_Heli_Light_02_unarmed_F",265000],
		["C_Rubberboat",400],
		["C_Boat_Civil_01_F",4500],
		["B_Boat_Transport_01_F",450],
		["C_Boat_Civil_01_police_F",3500],
		["B_Boat_Armed_01_minigun_F",16500],
		["B_SDV_01_F",25000],
		["B_MRAP_01_F",15000],
		["I_MRAP_03_F",2500000],
		["C_Kart_01_Blu_F",7500],
		["C_Kart_01_Fuel_F",7500],
		["C_Kart_01_Red_F",7500],
		["C_Kart_01_Vrana_F",7500],
		["I_Heli_light_03_unarmed_F",30000],
		["C_Offroad_01_repair_F",1500]
	]
};
__CONST__(life_pimpgarage_prices,life_pimpgarage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",15000],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",500000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",600000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",50000],
	["B_MRAP_01_hmg_F",100000],
	["O_APC_Wheeled_02_rcws_F",150000],
	["I_MRAP_03_F",600000],
	["O_Truck_03_ammo_F",80000],
	["O_Truck_03_device_F",100000],
	["B_Truck_01_fuel_F",20000],
	["O_Truck_02_fuel_F",30000],
	["O_Truck_03_fuel_F",40000],
	["B_Truck_01_ammo_F",50000],
	["O_Truck_03_transport_F",50000],
	["O_Truck_03_covered_F",65000]

];
__CONST__(life_garage_sell,life_garage_sell);

admin_vehicles = [
"B_Quadbike_01_F",
"C_Kart_01_F",
"B_Lifeboat",
"B_Boat_Transport_01_F",
"C_Boat_Civil_01_F",
"I_SDV_01_F",
"B_Truck_01_mover_F",
"B_Truck_01_box_F",
"O_Truck_03_transport_F",
"O_Truck_03_covered_F",
"C_Van_01_box_F",
"C_SUV_01_F",
"C_Hatchback_01_F",
"C_Hatchback_01_sport_F",
"B_G_Offroad_01_F",
"B_MRAP_01_F",
"B_MRAP_01_hmg_F",
"O_MRAP_02_F",
"I_MRAP_03_F",
"O_APC_Wheeled_02_rcws_F",
"B_G_Van_01_transport_F",
"O_Truck_02_covered_F",
"O_Truck_02_transport_F",
"B_G_Offroad_01_armed_F",
"B_Heli_Light_01_F",
"C_Heli_light_01_luxe_F",
"O_Heli_Light_02_unarmed_F",
"I_Heli_light_03_unarmed_F",
"I_Heli_Transport_02_F",
"B_Heli_Transport_03_unarmed_F",
"O_Heli_Transport_04_F",
"B_APC_Tracked_01_CRV_F"
];
