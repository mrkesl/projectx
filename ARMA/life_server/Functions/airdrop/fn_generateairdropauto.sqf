/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright � 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

sleep 1;

if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};

_chance = floor(random 100);
if (_chance>airdrop_chance) exitWith {};
_toWait = (random (airdrop_time_max - airdrop_time_min)) + airdrop_time_min;
sleep _toWait; // Wait abit for the airdrop
if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};
airdrop_goingon=true;

// AIRDROP STARTEN
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>Ein Helikopter ist unterwegs! In ca. 15 Minuten werden Hilfsgüter abgeworfen!</t>"] remoteExec ["life_fnc_broadcast", 0, false];
_poses = count airdrop_positions;
_inArr = floor(random _poses);
_dest = airdrop_positions select _inArr;
["Airdrop.log", "Der automatische Airdrop wurde ausgefuehrt."] remoteExec ["life_fnc_admin_log", 2, false];
sleep 300;

_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [500,500];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "Abwurfzone";
"Airdropmarkertext" setMarkerType "mil_warning";
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>10 Minuten bis die Hilfsgüter abgeworfen werden. Achte auf dein GPS!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

sleep 300;

[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>5 Minuten bis der Helikopter die Hilfsgüter abwirft!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>4 Minuten bis der Helikopter die Hilfsgüter abwirft!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>3 Minuten bis der Helikopter die Hilfsgüter abwirft!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>2 Minuten bis der Helikopter die Hilfsgüter abwirft!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

sleep 60;

[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>1 Minuten bis der Helikopter die Hilfsgüter abwirft!</t>"] remoteExec ["life_fnc_broadcast", 0, false];
diag_log "###################################### AIRDROP ERFOLGREICH AUSGEFÜHRT ######################################";

heli1 = CreateVehicle [airdrop_helicopter_main, [7950, 9667, 0], [], 0, "FLY"];
heli2 = CreateVehicle [airdrop_helicopter_scnd, [7950, 9700, 0], [], 0, "FLY"];
heli3 = CreateVehicle [airdrop_helicopter_scnd, [7950, 9630, 0], [], 0, "FLY"];

heli1 allowDamage false;
heli2 allowDamage false;
heli3 allowDamage false;

_mygroup1 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup2 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup3 = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x moveInDriver heli1; _x allowDamage false;} forEach units _mygroup1;
{_x moveInDriver heli2; _x allowDamage false;} forEach units _mygroup2;
{_x moveInDriver heli3; _x allowDamage false;} forEach units _mygroup3;

_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[50,30000,0], 0];
_mygroup2 addWaypoint [_dest, 0];
_mygroup2 addWaypoint [[50,30000,0], 0];
_mygroup3 addWaypoint [_dest, 0];
_mygroup3 addWaypoint [[50,30000,0], 0];

_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];

_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_containerdummy attachTo [heli1,[0,0,-3.5]];
_containerdummy setDir 90;


while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1; sleep 1; };
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>Hilfsgüter wurden abgeworfen - 20 Minuten bis zur Selbstzerstörung!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

// Drop the container

deleteVehicle _containerdummy;
sleep 0.1;
_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
sleep 0.1;
while { (getPos _container select 2) > 2 } do { "airbox_marker" setMarkerPos getPos _container;sleep 1; };
detach _container;
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2)+0.5];
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
sleep 6;
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deleteVehicle _container;
sleep 0.5;
_box = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"];
_box allowDamage false;
_smoke="SmokeShellGreen" createVehicle [getpos _box select 0,getpos _box select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];

// Fill box

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;


sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_SW_Black_F", 1];};
sleep 0.1;
/*
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];};
sleep 0.1;
*/
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_GL_F", 5];};
sleep 0.1;
/*
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", 50];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["3Rnd_UGL_FlareRed_F", 20];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MX_F", 1];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow", 50];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_EBR_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["srifle_DMR_01_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_Katiba_GL_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["hgun_Pistol_heavy_01_F", 5];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["arifle_MXM_F", 1];};
sleep 0.1;
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["30Rnd_65x39_caseless_mag", 20];};
sleep 0.1;
*/
_var=floor(random 2);
if (_var==1) then {_box addWeaponCargoGlobal ["LMG_Mk200_F", 1];};
sleep 0.1;
/*
_var=floor(random 2);
if (_var==1) then {_box addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 2];};
sleep 0.1;
*/
private["_bplaninside","_gather","_val","_item","_num","_veh","_random","_array","_array2","_inv","_weight"];
_bplaninside = 0;
_gather = [""];
_val = 0;
_item = [""];
_num = 0;
_veh = "";
_random = "";
_array = [""];
_array2 = [""];
_inv = "";
_weight = 0;
_box setVariable["Trunk",[[],0],true];
_rnd = round (random 5);
if (_rnd < 3) then { _rnd = 3};
_i = 0;
while { _i < _rnd } do {

    _rnd2 = round (random 100);

    if(_rnd2>= 0 && _rnd2 < 50) then{
        _array = ["sfetzen","nadel","gfaden","rfaden","ofaden","sfaden","cstoff","rsfetzen","npren","sflasche"];
		_random = _array select floor random count _array;
        _gather = _random; _val = round (random 20);
        };

        if(_rnd2 <= 20 && _rnd2 >= 11) then{
        _array = ["uranium"];
		_random = _array select floor random count _array;
        _gather = _random; _val = round (random 10);
        };

        if(_rnd2 < 31 && _rnd2 > 20) then{
        _array = ["blynx2","blynx3","blrr2","bzafir","pat","patg"];
		_random = _array select floor random count _array;
        _gather = _random; _val = 1;
        _bplaninside =  _bplaninside + 1;
        };

        if(_rnd2 >= 61 && _rnd2 <= 100) then{
        _array = ["bolzen","gschaft","feder","spulver","abzug","glauf","vhalterung","schrauben","plauf","al"];
		_random = _array select floor random count _array;
		_gather = _random; _val = round (random 5);
        };

        if(_rnd2 > 51 && _rnd2 <= 60) then{
        _array = ["heroinu","feder","donuts","diamond","iron_r","copper_r","schmuck"];
		_random = _array select floor random count _array;
        _gather = _random; _val = round (random 30);
        };

    if(_bplaninside < 2) then {

	_item = _gather;
	_num = _val;
	_array2 = _box getvariable "Trunk";
	_inv = _array2 select 0;
	_weight = _array2 select 1;
	_inv pushback [_item, _num];
	_weight = _weight + (([_item] call life_fnc_itemWeight) * _num);
	_box setvariable ["Trunk",[_inv, _weight], true];
    _i = _i + 1;
	}else{_bplaninside = 1;};
};

// Fill box end

sleep 300;
deleteVehicle heli1;
deleteVehicle heli2;
deleteVehicle heli3;
{deleteVehicle _x} forEach units _mygroup1;
{deleteVehicle _x} forEach units _mygroup2;
{deleteVehicle _x} forEach units _mygroup3;

sleep 600;
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>5 Minuten bis zur Selbstzerstörung!</t>"] remoteExec ["life_fnc_broadcast", 0, false];
sleep 240;
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>1 Minuten bis zur Selbstzerstörung!</t>"] remoteExec ["life_fnc_broadcast", 0, false];
sleep 50;
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>10 Sekunden bis zur Selbstzerstörung!</t>"] remoteExec ["life_fnc_broadcast", 0, false];
sleep 10;
[5,"<t size='1.2'><t color='#FF0000'>Wichtiger Hinweis!</t></t><br/><br/><t size='1'>Die Ladung der Hilfsgüter war instabil, sie ist mit einer starken Detonation explodiert!</t>"] remoteExec ["life_fnc_broadcast", 0, false];

_bmb = "Bomb_04_F" createVehicle [(getPos _box select 0)+0,(getPos _box select 1)-0,0];
sleep 1;
deleteVehicle _box;

"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

deleteMarker "airbox_marker";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";

airdrop_goingon = false;
