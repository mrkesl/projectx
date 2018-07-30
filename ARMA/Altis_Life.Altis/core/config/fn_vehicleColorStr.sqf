/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: Ragebone

	Description:
	Master configuration for color strings depending on their index location.
*/
params [["_vehicle", "", [""]], ["_index", -1, [0]]];
private "_color";
_color = "";

switch (_vehicle) do{
	case "C_Offroad_01_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde"};
			case 1: {_color = "Zivilstreife"};
			case 2: {_color = "Rettungsdienst"};
			case 3: {_color = "AAC"};
			case 4: {_color = "Rot";};
			case 5: {_color = "Gelb";};
			case 6: {_color = "Weiss";};
			case 7: {_color = "Blau";};
			case 8: {_color = "Dunkel Rot";};
			case 9: {_color = "Blau Weiß"};
			case 10: {_color = "Altes Taxi"};
			case 11: {_color = "Schwarz"};
			case 12: {_color = "Rockstar Gelb"};
			case 13: {_color = "Rockstar Lila"};
			case 14: {_color = "Taxi"};
			case 15: {_color = "Rot"};
		};
	};
	case "B_Truck_01_transport_F":{
		switch (_index) do{
			case 0: {_color = "AAC"};
		};
	};
	case "O_Heli_Transport_04_F":{
		switch (_index) do{
			case 0: {_color = "AAC Schwarz / Gelb"};
		};
	};
	case "B_Heli_Transport_03_unarmed_F":{
		switch (_index) do{
			case 0: {_color = "AAC Schwarz / Gelb"};
			case 1: {_color = "COP Schwarz"};
		};
	};
	case "B_Heli_Transport_01_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde"};
		};
	};
	case "B_Truck_01_covered_F":{
		switch (_index) do{
			case 0: {_color = "Södlner"};
		};
	};
	case "C_Hatchback_01_F":{
		switch (_index) do{
			case 0: {_color = "Beige";};
			case 1: {_color = "Grün";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkel Blau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Schwarz"};
		};
	};
	case "C_Boat_Civil_01_police_F":{
		switch (_index) do{
			case 0: {_color = "Küstenwache";};
		};
	};
	case "C_Hatchback_01_sport_F":{
		switch(_index) do{
			case 0: {_color = "Rot"};
			case 1: {_color = "Dunkel Blau"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Schwarz / Weiss"};
			case 4: {_color = "Braun"};
			case 5: {_color = "Grün"};
			case 6: {_color = "Nationalgarde"};
			case 7: {_color = "Taxi"};
			case 8: {_color = "Hello Kitty"};
			case 9: {_color = "RedGull"};
			case 10: {_color = "Monster Energy"};
		};
	};
	// messed up?
	case "C_SUV_01_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde";};
			case 1: {_color = "Zivilstreife";};
			case 2: {_color = "Maschaft RTW";};
			case 3: {_color = "Dunkel Rot";};
			case 4: {_color = "Silber";};
			case 5: {_color = "Orange";};
			case 6: {_color = "Monster Energy";};
			case 7: {_color = "Nyan Cat";};
			case 8: {_color = "Taxi";};
			case 9: {_color = "BMW M-Power";};
			case 10: {_color = "Monster Energy";};
		};
	};
	case "C_Van_01_box_F":{
		switch (_index) do{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
			case 2: {_color = "Rettungswagen"};
		};
	};
	case "C_Van_01_transport_F":{
		switch (_index) do{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	case "C_Van_01_fuel_F":{
		switch (_index) do{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	case "C_Offroad_01_repair_F":{
		switch (_index) do{
			case 0: {_color = "AAC"};
		};
	};
	case "B_Quadbike_01_F" :{
		switch (_index) do{
			case 0: {_color = "Braun"};
			case 1: {_color = "Wüste"};
			case 2: {_color = "Schwarz"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Rot"};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Waldgrün"};
			case 7: {_color = "Jagdgrün"};
			case 8: {_color = "Rebellgrün"};
		};
	};
	case "B_Heli_Light_01_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Blau"};
			case 3: {_color = "Rot"};
			case 4: {_color = "Monster Energy"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blau"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Wellen Blau"};
			case 13: {_color = "Rebellenweiss"};
			case 14: {_color = "Rettungsdienst"};
			case 15: {_color = "Monster"};
		};
	};
	case "O_Heli_Light_02_unarmed_F":{
		switch (_index) do{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Weiss / Blau"};
			case 2: {_color = "Waldgrün"};
			case 3: {_color = "Wüstenbraun"};
			case 4: {_color = "EMS White"};
		};
	};
	case "B_MRAP_01_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde"};
			case 1: {_color = "Schwarz"};
		};
	};
	case "I_Truck_02_covered_F":{
		switch (_index) do{
			case 0: {_color = "Orange"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Nationalgarde"};
		};
	};
	case "I_Heli_light_03_unarmed_F":{
		switch (_index) do{
			case 0: {_color = "Rettungsdienst"};
			case 1: {_color = "Nationalgarde"};
		};
	};
	case "I_Truck_02_transport_F":{
		switch (_index) do{
			case 0: {_color = "Orange"};
			case 1: {_color = "Schwarz"};
		};
	};
	case "O_MRAP_02_F":{
		switch (_index) do{
			//case 0: {_color = "Nationalgarde"};
			case 0: {_color = "Tarnfleck"};
		};
	};
	case "I_MRAP_03_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde"};
			//case 1: {_color = "Schwarz"};
			//case 2: {_color = "Tarnfleck"};
			};
	};
	case "B_APC_Wheeled_01_cannon_F":{
		switch (_index) do{
			case 0: {_color = "Schwarz"};
		};
	};
	case "O_Heli_Attack_02_black_F":{
		switch (_index) do{
			case 0: {_color = "Schwarz"};
		};
	};
	case "I_Heli_Transport_02_F":{
		switch (_index) do{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Ion"};
			case 3: {_color = "Dahoman"};
			case 4: {_color = "AAC"};
		};
	};
	case "O_APC_Wheeled_02_rcws_F":{
		switch (_index) do{
			case 0: {_color = "Nationalgarde"};
		};
	};
	default {
        _color = "Standard";
    };
};
_color;
