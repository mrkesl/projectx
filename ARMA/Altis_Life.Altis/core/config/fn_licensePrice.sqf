/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
params [["_type", "", [""]]];
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1000}; //Drivers License cost
	case "boat": {10000}; //Boating license cost
	case "pilot": {50000}; //Pilot/air license cost
	case "gun": {15000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {70000}; //Heroin processing license cost
	case "marijuana": {50000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {300000}; //Rebel license cost
	case "truck": {40000}; //Truck license cost
	case "diamond": {15000};
	case "salt": {12000};
	case "cocaine": {75000};
	case "sand": {12000};
	case "iron": {10000};
	case "copper": {10000};
	case "cement": {10000};
	case "mair": {15000};
	case "home": {75000};
	case "stiller":{100000};
	case "liquor":{12000};
	case "bottler":{13000};
	case "mash":{12000};
	case "uranium": {800000};
	case "joint": {45000};
	case "wood": {30000};
};