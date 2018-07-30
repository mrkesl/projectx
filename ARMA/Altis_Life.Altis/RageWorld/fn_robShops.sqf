/*
file: fn_robShops.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
*/
params [["_shop", "", [""]], ["_robber", ObjNull, [ObjNull]]/*, ["_action"]*/];
private["_kassa","_ui","_progress","_pgText","_cP","_pos","_marker"];

_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
if(side _robber != civilian) exitWith { hint "Du kannst diese Tankstelle nicht ausrauben!" };
_cops = (west countSide playableUnits);
if(_cops < 2) exitWith{hint "Es sind nicht genug Gardisten im Dienst um diese Tankstelle auszurauben!!";};
if(_robber distance _shop > 5) exitWith { hint "Du musst im Umkreis von 5 Metern sein, um die Tankstelle auszurauben" };
//if !(_kassa) then { _kassa = 1000; };
if (_shop getvariable["raubaktiv",false]) exitWith { hint "Raub ist im Gange!" }; //fix by Creedcoder
if (vehicle player != _robber) exitWith { hint "Steig aus dem Fahrzeug!" };
if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "HaHa, du bedrohst mir nicht! Hau lieber ab du Looser!" };
if (_kassa == 0) exitWith { hint "Da ist kein Geld in der Kasse!" };
_kassa = 10000 + round(random 10000);
//_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
hint "Der Kassierer hat den stillen Alarm ausgelöst, die Nationalgarde ist unterwegs!";
[1,format["ALARM! - Tankstelle: %1 wird ausgeraubt!", _shop]] remoteExec ["life_fnc_broadcast", west, false];
_shop setvariable["raubaktiv",true,true]; //fix by Creedcoder
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Raub im Gange, bleibe in der Umgebung! (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
while{true} do
{
sleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Raub im Gange, bleibe in der Umgebung! (10m) (%1%2)...",round(_cP * 100),"%"];
_Pos = getPos player; // by ehno: get player pos
_marker = createMarker [str(_shop), _Pos]; //by ehno: Place a Maker on the map //fix by Creedcoder
_marker setMarkerColor "ColorRed"; //fix by Creedcoder
_marker setMarkerText "!ACHTUNG! TANKSTELLEN RAUB !ACHTUNG!"; //fix by Creedcoder
_marker setMarkerType "mil_warning"; //fix by Creedcoder
if(_cP >= 1) exitWith {_shop setvariable["raubaktiv",false,true];}; //fix by Creedcoder
if(_robber distance _shop > 10.5) exitWith {_shop setvariable["raubaktiv",false,true];}; //fix by Creedcoder
if!(alive _robber) exitWith {_shop setvariable["raubaktiv",false,true];}; //fix by Creedcoder
};
if(_robber distance _shop > 10.5) exitWith { deleteMarker _marker; _shop switchMove ""; hint "Du musst innerhalb von 10 Metern in der Umgebung bleiben! - Die Kasse ist nun geschlossen."; 5 cutText ["","PLAIN"]; _shop setvariable["raubaktiv",false,true];}; //fix by Creedcoder
5 cutText ["","PLAIN"];
titleText[format["Du hast $%1 gestohlen, jetzt verschwinde bevor die Nationalgarde da ist!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker str(_shop); // by ehno delete maker //fix by Creedcoder
player setvariable["cash", (player getvariable["cash",0]) + _kassa, true];
_shop setvariable["raubaktiv",false,true]; //fix by Creedcoder
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[getPlayerUID _robber,name _robber,"211"] remoteExec ["life_fnc_wantedAdd", 2, false];
sleep 300;
//_action = _shop addAction["Tankstelle ausrauben",life_fnc_robShops];
_shop switchMove "";
