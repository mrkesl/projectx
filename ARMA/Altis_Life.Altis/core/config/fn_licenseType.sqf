/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
params [["_type", "", [""]], ["_mode", -1, [0]]];
private["_ret","_var"];
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "civ_driver"}; //Drivers License cost
			case "boat": {_var = "civ_boat"}; //Boating license cost
			case "pilot": {_var = "civ_air"}; //Pilot/air license cost
			case "gun": {_var = "civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "civ_dive"}; //Diving license cost
			case "oil": {_var = "civ_oil"}; //Oil processing license cost
			case "cair": {_var = "cop_air"}; //Cop Pilot License cost
			case "swat": {_var = "cop_swat"}; //Swat License cost
			case "cg": {_var = "cop_cg"}; //Coast guard license cost
			case "heroin": {_var = "civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "civ_gang"}; //Gang license cost
			case "rebel": {_var = "civ_rebel"}; //Rebel License
			case "truck":{_var = "civ_truck"}; //Truck License
			case "diamond": {_var = "civ_diamond"};
			case "salt": {_var = "civ_salt"};
			case "cocaine": {_var = "civ_coke"};
			case "sand": {_var = "civ_sand"};
			case "iron": {_var = "civ_iron"};
			case "copper": {_var = "civ_copper"};
			case "cement": {_var = "civ_cement"};
			case "mair": {_var = "med_air"};
			case "home": {_var = "civ_home"};
			case "liquor": {_var = "civ_liquor"};
			case "beer": {_var = "civ_liquor"};
			case "stiller": {_var = "civ_stiller"};
			case "whiskey": {_var = "civ_stiller"};
			case "moonshine": {_var = "civ_stiller"};
			case "mash": {_var = "civ_stiller"};
			case "bottledshine": {_var = "civ_bottler"};
			case "bottledbeer": {_var = "civ_bottler"};
			case "bottledwhiskey": {_var = "civ_bottler"};
			case "bottler": {_var = "civ_bottler"};
			case "glassbottle": {_var = "civ_bottler"};
			case "uranium": {_var = "civ_uranium"};
			case "uranium1": {_var = "civ_uranium"};
			case "uranium2": {_var = "civ_uranium"};
			case "uranium2b": {_var = "civ_uranium"};
			case "uranium3": {_var = "civ_uranium"};
			case "uranium4": {_var = "civ_uranium"};
			case "joint": {_var = "civ_joint"};
			case "wood": {_var = "civ_wood"};
			case "woodc": {_var = "civ_wood"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "civ_driver": {_var = "driver"}; //Drivers License cost
			case "civ_boat": {_var = "boat"}; //Boating license cost
			case "civ_air": {_var = "pilot"}; //Pilot/air license cost
			case "civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "civ_dive": {_var = "dive"}; //Diving license cost
			case "civ_oil": {_var = "oil"}; //Oil processing license cost
			case "cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "cop_swat": {_var = "swat"}; //Swat License cost
			case "cop_cg": {_var = "cg"}; //Coast guard license cost
			case "civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "civ_gang": {_var = "gang"}; //Gang license cost
			case "civ_rebel": {_var = "rebel"}; //Rebel License
			case "civ_truck":{_var = "truck"}; //Truck License
			case "civ_diamond": {_var = "diamond"};
			case "civ_salt": {_var = "salt"};
			case "civ_coke": {_var = "cocaine"};
			case "civ_sand": {_var = "sand"};
			case "civ_iron": {_var = "iron"};
			case "civ_copper": {_var = "copper"};
			case "civ_cement": {_var = "cement"};
			case "med_air": {_var = "mair"};
			case "civ_home": {_var = "home"};		
			case "civ_liquor": {_var = "liquor"};
			case "civ_liquor": {_var = "beer"};
			case "civ_stiller": {_var = "stiller"};
			case "civ_stiller": {_var = "whiskey"};
			case "civ_stiller": {_var = "moonshine"};
			case "civ_stiller": {_var = "mash"};
			case "civ_bottler": {_var = "bottledshine"};
			case "civ_bottler": {_var = "bottledbeer"};
			case "civ_bottler": {_var = "bottledwhiskey"};
			case "civ_bottler": {_var = "bottler"};
			case "civ_bottler": {_var = "glassbottle"};	
			case "civ_uranium": {_var = "uranium"};
			case "civ_uranium": {_var = "uranium1"};
			case "civ_uranium": {_var = "uranium2"};
			case "civ_uranium": {_var = "uranium2b"};
			case "civ_uranium": {_var = "uranium3"};
			case "civ_uranium": {_var = "uranium4"};	
            case "civ_joint": {_var = "joint"};		
			case "civ_wood": {_var = "wood"};	
            case "civ_wood": {_var = "woodc"};			
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;