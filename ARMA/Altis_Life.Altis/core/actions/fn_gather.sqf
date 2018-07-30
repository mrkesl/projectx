/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	fixed by Larvell

	Description:
	Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","rye_1","hops_1","yeast_1","uran_1","muellhalde_1"];
_zone = "";
_gather = "";
_pin = 0;
_val = 0;
_break = false;

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	//life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["rye_1"]): {_gather = "rye"; _val = 2;};
	case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = 2;};
	case (_zone in ["hops_1"]): {_gather = "hops"; _val = 2;};
	case (_zone in ["uran_1"]): {_gather = "uranium1"; _val = 1;};
	case (_zone in ["muellhalde_1"]): {

	_Xrnd = round(random 150);

	if(_Xrnd >= 0 && _Xrnd < 10) then{
	_array = ["sfetzen","nadel","gfaden","rfaden","ofaden","sfaden","cstoff","rsfetzen","npren","sflasche"];
    _random = _array select floor random count _array;
	_gather = _random; _val = 1;
	};

	if(_Xrnd < 70 && _Xrnd >= 10) then{
	_array = ["fisch","dirt","papier","ptuete","stiefel","ssenkel","hoffnung","glasflasche"];
    _random = _array select floor random count _array;
	_gather = _random; _val = 1;
	};

	if(_Xrnd <= 75 && _Xrnd >= 70) then{
	_value = round(random 9990) + 10;
	player setvariable["cash", (player getvariable["cash",0]) + _value, true];
	_gather = "diamond";	_val = 1;
	hint "Glückwunsch, du hast auf der Suche nach Hoffnung Geld gefunden, zur Belohnung erhälst du für deine Mühen einen Diamanten und Geld.";
	};

	if(_Xrnd < 80 && _Xrnd >= 75) then{
	_array = ["FirstAidKit","ToolKit"];
		private "_random";
    _random = _array select floor random count _array;
		if (true) exitWith {player addItem _random; hint format["Du hast ein %1 gefunden.", _random];_break = true;};
	};

	if(_Xrnd <= 83 && _Xrnd >= 80) then{
	_array = ["uranium"];
    _random = _array select floor random count _array;
	_gather = _random; _val = 1;
	};

	if(_Xrnd <= 88  && _Xrnd >= 84) then{
	_gather = "nadel"; _val = 1;
	_pin = 1;
	};

	if(_Xrnd < 90 && _Xrnd > 88) then{
	_array = ["blynx1","blrr2","bzafir","pat","patg"];
    _random = _array select floor random count _array;
	_gather = _random; _val = 1;
	};
	if(_Xrnd >= 90 && _Xrnd <=95) then{
	_array = ["bolzen","gschaft","feder","spulver","abzug","glauf","vhalterung","schrauben","plauf","al"];
    _random = _array select floor random count _array;
	_gather = _random; _val = 1;
	};

	if(_Xrnd > 95 && _Xrnd <=100) then{
	_array = ["apple","heroinu","feder","tuna","donuts","diamond","iron_r","copper_r","kabelbinder","schmuck"];
    _random = _array select floor random count _array;
	_gather = _random; _val = 1;
	};

	if(_Xrnd <= 150 && _Xrnd > 100) then{
	_gather = "pflasche"; _val = 1;
	};
	};
	default {""};
};

//gather check??
if(vehicle player != player || _break) exitWith {};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(_pin == 1) then{
hint "Du hast dich an einer Spritze gestochen, geh lieber zum nächsten Arzt!";
	sleep 5;
	hint "Irgendwie geht es mir nicht so gut...";
	call life_fnc_muell;
	sleep 5;
	hint "Oh mir tut alles weh!";

	_damage = Damage Player + 0.25;
	player setDamage _damage;
_pin = 0;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

//Create uran zones
_uranZones = ["uran_1"];
{
_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
_zone setTriggerArea[150,150,0,false];
_zone setTriggerActivation["CIV","PRESENT",true];
} foreach _uranZones;
