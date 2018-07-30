/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
params [["_var", "", [""]]];
if(_var == "") exitWith {""};

switch (_var) do{
	//Virtual Inventory Items
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {"Kupfererz"};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_underwatercharge": {(localize "STR_Item_UCharge")};
	case "life_inv_goldbarp": {(localize "STR_Item_GoldScrap")};
	case "life_inv_mash": {"Getreide-Brei"};
	case "life_inv_yeast": {"Hefe"};
	case "life_inv_rye": {"Roggen"};
	case "life_inv_hops": {"Hopfen"};
	case "life_inv_whiskey": {"Destillierter Whiskey"};
	case "life_inv_beerp": {"Fermentiertes Bier"};
	case "life_inv_bottles": {"Glas Flaschen"};
	case "life_inv_cornmeal": {"Maismehl Getreide"};
	case "life_inv_bottledwhiskey": {"Abgefüllter Whiskey"};
	case "life_inv_bottledbeer": {"Abgefülltes Bier"};
	case "life_inv_bottledshine": {"Abgefülltes Moonshine"};
	case "life_inv_moonshine": {"Destillierter Moonshine"};
	case "life_inv_kabelbinder":{"Kabelbinder"};
	case "life_inv_huetchen":{"Verkehrsleitkegel"};
	case "life_inv_absperrung":{"Absperrung"};
	case "life_inv_tapesign":{"Absperrband"};
	case "life_inv_pole":{"Stab-Warnbarke"};
	case "life_inv_strahler":{"Baustrahler"};
	case "life_inv_battery": {"Handyakku"};
	case "life_inv_ipuranium": {"Illegale Uranlösung"};
	case "life_inv_puranium": {"Legale Uranauflösung"};
	case "life_inv_uranium1": {"Uranabfall"};
	case "life_inv_uranium2": {"Gereinigtes Uran"};
	case "life_inv_uranium3": {"Aufgelöstes Uran"};
	case "life_inv_uranium4": {"Uran"};
	case "life_inv_uranium": {"Angereichertes Uran"};
	case "life_inv_joint": {"Joint"};
	//NUTZLOSE ITEMS
	case "life_inv_pflasche": {"Pfandflasche"};
	case "life_inv_spritze": {"Gebrauchte Spritze"};
	case "life_inv_fisch": {"alte Fischreste"};
	case "life_inv_dirt": {"Dreck"};
	case "life_inv_papier": {"Papierfetzen"};
	case "life_inv_ptuete": {"Plastiktüte"};
	case "life_inv_stiefel": {"alter Stiefel"};
	case "life_inv_ssenkel": {"alter Schnürsenkel"};
	case "life_inv_hoffnung": {"Hoffnung"};
	case "life_inv_glasflasche": {"wertlose Glasflasche"};
	//WAFFENPARTS
	case "life_inv_bolzen": {"Bolzen"};
	case "life_inv_gschaft": {"Gewehrschaft"};
	case "life_inv_feder": {"Eisenfeder"};
	case "life_inv_spulver": {"Schwarzpulver"};
	case "life_inv_abzug": {"Abzug"};
	case "life_inv_glauf": {"Gewehrlauf"};
	case "life_inv_vhalterung": {"Visierhalterung"};
	case "life_inv_schrauben": {"Edelstahl Schrauben"};
	case "life_inv_plauf": {"Pistolenlauf"};
	//ROHSTOFFE
	case "life_inv_schmuck": {"Schmuck"};
	//KLEIDUNGSPARTS
	case "life_inv_sfetzen": {"Stofffetzen"};
	case "life_inv_nadel": {"Nadel"};
	case "life_inv_gfaden": {"grüner Faden"};
	case "life_inv_rfaden": {"roter Faden"};
	case "life_inv_ofaden": {"oliver Faden"};
	case "life_inv_sfaden": {"schwarzer Faden"};
	case "life_inv_cstoff": {"Camouflage Stoff"};
	case "life_inv_rsfetzen": {"roter Stofffetzen"};
	case "life_inv_bsfetzen": {"blauer Stoffetzen"};
	case "life_inv_sflasche": {"Sauerstoff Flasche"};
	case "life_inv_npren": {"Neopren"};
	//BAUPLÄNE
	case "life_inv_blynx1": {"Bauplan Lynx Seite 1/3"};
	case "life_inv_blynx2": {"Bauplan Lynx Seite 2/3"};
	case "life_inv_blynx3": {"Bauplan Lynx Seite 3/3"};
	case "life_inv_blrr1": {"Bauplan LRR 320 Seite 1/2"};
	case "life_inv_blrr2": {"Bauplan LRR 320 Seite 2/2"};
	case "life_inv_btitan1": {"Bauplan Titan Compact Seite 1/2"};
	case "life_inv_btitan2": {"Bauplan Titan Compact Seite 2/2"};
	case "life_inv_bzafir": {"Bauplan Zafir LMG"};

	//Diverses
	case "life_inv_axe": {"Axt"};
	case "life_inv_wood": {"Holz"};
	case "life_inv_woodc": {"Bretter"};
	case "life_inv_woodi": {"Impregnierte Holzbretter"};
	case "life_inv_pat": {"Patronenhülse"};
	case "life_inv_al": {"Aluminium"};
	case "life_inv_patg": {"Patronengurt"};
	case "life_inv_fuelPipe": {"Benzinschlauch"};
	case "life_inv_speedbomb": {"Autoradio"};

	//License Block
	case "civ_driver": {(localize "STR_License_Driver")};
	case "civ_air": {"Flugschein"};
	case "civ_heroin": {"Mohnherstellungslizenz"};
	case "civ_oil": {(localize "STR_License_Oil")};
	case "civ_dive": {(localize "STR_License_Diving")};
	case "civ_boat": {(localize "STR_License_Boat")};
	case "civ_gun": {"Waffenschein"};
	case "cop_air": {(localize "STR_License_Pilot")};
	case "cop_swat": {(localize "STR_License_Swat")};
	case "cop_cg": {(localize "STR_License_CG")};
	case "civ_rebel": {(localize "STR_License_Rebel")};
	case "civ_truck": {(localize "STR_License_Truck")};
	case "civ_diamond": {(localize "STR_License_Diamond")};
	case "civ_copper": {(localize "STR_License_Copper")};
	case "civ_iron": {(localize "STR_License_Iron")};
	case "civ_sand": {(localize "STR_License_Sand")};
	case "civ_salt": {(localize "STR_License_Salt")};
	case "civ_coke": {"Alkaloidherstellungslizenz"};
	case "civ_marijuana": {"Hanfanbaulizenz"};
	case "civ_cement": {(localize "STR_License_Cement")};
	case "med_air": {(localize "STR_License_Pilot")};
	case "civ_home": {(localize "STR_License_Home")};
	case "civ_stiller": {"Destilator"};
	case "civ_liquor": {"Brau Lizenz"};
	case "civ_bottler": {"Abfüll Lizenz"};
	case "civ_gang": {"Gang Lizenz??? Admin Abuse!!!"};
	case "civ_uranium": {"Uran Lizenz"};
	case "civ_joint": {"Joint Herstellung"};
	case "civ_wood": {"Forstlizenz"};
};
