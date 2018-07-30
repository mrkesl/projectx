/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do{
	case "market": {["Markt",["water","cornmeal","rabbit","apple","redgull","tbacon","pickaxe","fuelF","fuelE","peach","storagesmall","storagebig","axe","pflasche","schmuck"]]};
	case "rebel": {["Rebellen Markt",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","fuelE","peach","boltcutter","blastingcharge","kabelbinder","underwatercharge","fuelPipe","speedbomb"]]};
	case "gang": {["Gang Markt", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","fuelE","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Futterhaus",["turtlesoup","turtle"]]};
	case "coffee": {["Libra Kaffee Club",["coffee","donuts"]]};
	case "bar": {["Bar",["water","coffee","donuts","redgull","bottledbeer","bottledwhiskey","bottledshine"]]};
	case "heroin": {["Drogenhändler",["cocainep","heroinp","marijuana","cannabis","cocaine","heroinu","joint"]]};
	case "oil": {["Ölhändler",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Fischmarkt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Glashändler",["glass"]]};
	case "iron": {["Metallhändler",["iron_r","copper_r"]]};
	case "diamond": {["Diamantenhändler",["diamond","diamondc"]]};
	case "salt": {["Salzhändler",["salt_r"]]};
	case "cop": {["Gardisten Markt",["donuts","coffee","water","rabbit","apple","redgull","fuelF","defusekit","spikeStrip","absperrung","huetchen","pole","tapesign","strahler","lockpick"]]};
	case "cement": {["Zementhändler",["cement"]]};
	case "gold": {["Goldhändler",["goldbar","goldbarp"]]};
	case "moonbar": {["Moonshinebar",["bottledshine"]]};
	case "it_tank": {["Tankstellen Shop",["water","apple","fuelF"]]};
	case "item_ad": {["AAC Markt",["water","apple","redgull","donuts","coffee","fuelF","absperrung","pole","tapesign","strahler","huetchen"]]};
	case "uranium": {["Uranhändler",["uranium","puranium","ipuranium"]]};
	case "holz": {["Zimmerei",["wood","woodc","woodi"]]};
	case "forest": {["Markt",["axe","water","apple"]]};
};
