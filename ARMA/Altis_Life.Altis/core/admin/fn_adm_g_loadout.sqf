#include <macro.h>
/*
	File: fn_adm_g_loadout.sqf
	Author: Larvell

	Description: equip the default gear either for cop, med or civ


	HINWEIS: Loadouts werden vor Serverstart angepasst. Nur items die auch gekauft werden können!!!
*/
params [["_unit", objNull, [objNull]]];
if((player getVariable ["admin_level", 0]) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
_playid = getPlayerUID _unit;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit != player) exitWith {hint localize "STR_ANOTF_Error";};

switch (_playid) do {
	case "76561197974753800": {/*Larvell*/
		switch (playerSide) do	{
			case west: {
				comment "Exported from Arsenal by Larvell";

				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam_worn";
				["U_B_CombatUniform_mcam_worn"] spawn life_fnc_texturesync;
				for "_i" from 1 to 4 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
				_unit addVest "V_PlateCarrierGL_blk";
				for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
				for "_i" from 1 to 6 do {_unit addItemToVest "100Rnd_65x39_caseless_mag";};
				_unit addBackpack "B_Kitbag_rgr";
				["B_Kitbag_rgr"] spawn life_fnc_texturesync;
				for "_i" from 1 to 2 do {_unit addItemToBackpack "ToolKit";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				_unit addHeadgear "H_HelmetSpecB_blk";
				_unit addGoggles "G_Bandanna_shades";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_Black_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_flashlight";
				_unit addPrimaryWeaponItem "optic_AMS";
				_unit addPrimaryWeaponItem "bipod_01_F_blk";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles_OPFOR";

				comment "Set identity";
				[_unit,"MANW"] call bis_fnc_setUnitInsignia;

				comment "Set inventory and Eventhandler";
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				_unit addEventHandler ["Killed",{
				removeAllWeapons (_this select 0);
				removeAllItems (_this select 0);
				removeAllAssignedItems (_this select 0);
				removeUniform (_this select 0);
				removeVest (_this select 0);
				removeBackpack (_this select 0);
				removeHeadgear (_this select 0);
				removeGoggles (_this select 0);
				}];};
			case independent: { hint "Kein standard Equipment festgelegt";};
			case civilian: {

				comment "Exported from Arsenal by George Sears";

				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "U_I_G_resistanceLeader_F";
				for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
				for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
				_unit addVest "V_Rangemaster_belt";
				for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_45ACP_Mag_SMG_01";};
				_unit addBackpack "B_TacticalPack_oli";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "ToolKit";};
				for "_i" from 1 to 3 do {_unit addItemToBackpack "11Rnd_45ACP_Mag";};
				for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_45ACP_Mag_SMG_01";};
				_unit addHeadgear "H_Cap_oli_hs";
				_unit addGoggles "G_Aviator";

				comment "Add weapons";
				_unit addWeapon "SMG_01_F";
				_unit addPrimaryWeaponItem "muzzle_snds_acp";
				_unit addPrimaryWeaponItem "optic_Arco";
				_unit addWeapon "hgun_Pistol_heavy_01_F";
				_unit addHandgunItem "muzzle_snds_acp";
				_unit addHandgunItem "optic_MRD";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit addItemToUniform "ItemRadio";
				_unit additemtoBackpack "NVGoggles_INDEP";
				_unit additemtoVest "optic_NVS";

				comment "Set identity";
				_unit setFace "GreekHead_A3_08";
				_unit setSpeaker "Male11ENG";
				[_unit,"MANW"] call bis_fnc_setUnitInsignia;

				/*
				comment "Exported from Arsenal by Larvell";

				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "U_O_SpecopsUniform_ocamo";
				for "_i" from 1 to 5 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
				_unit addVest "V_BandollierB_khk";
				for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
				for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_762x54_Mag";};
				_unit addBackpack "B_Kitbag_mcamo";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "ToolKit";};
				_unit addHeadgear "H_MilCap_ocamo";
				_unit addGoggles "G_Tactical_Black";

				comment "Add weapons";
				_unit addWeapon "srifle_DMR_01_F";
				_unit addPrimaryWeaponItem "muzzle_snds_B";
				_unit addPrimaryWeaponItem "optic_AMS";
				_unit addPrimaryWeaponItem "bipod_01_F_mtp";
				_unit addWeapon "hgun_Pistol_heavy_01_F";
				_unit addHandgunItem "muzzle_snds_acp";
				_unit addHandgunItem "optic_MRD";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit addItemToUniform "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

				comment "Set identity";
				[_unit,"MANW"] call bis_fnc_setUnitInsignia;*/
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				life_inv_kabelbinder = 5;
				};};};

	case "76561197978624340": { /*Lou*/
		switch (playerSide) do	{
			case west: {
				_unit addUniform "U_B_CombatUniform_mcam_worn";
				["U_B_CombatUniform_mcam_worn"] spawn life_fnc_texturesync;
				_unit addvest "V_PlateCarrierGL_blk";
				_unit addBackpack "B_Bergen_blk";
				["B_Bergen_blk"] spawn life_fnc_texturesync;
				_unit addGoggles "G_Tactical_Clear";
				_unit addHeadgear "H_Beret_Colonel";
				_weapon = [_unit, "srifle_DMR_04_Tan_F", 6] call BIS_fnc_addWeapon;
				_unit additem "optic_MRCO";
				_unit additem "ItemGPS";
				_unit additem "NVGoggles_OPFOR";
				_unit additem "ItemRadio";
				_unit additem "Rangefinder";
				_unit additem "Medikit";
				_unit additem "Toolkit";
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				};
			case civilian: {
				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "U_O_CombatUniform_ocamo";
				_unit addItemToUniform "FirstAidKit";
				for "_i" from 1 to 3 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
				_unit addVest "V_PlateCarrierL_CTRG";
				for "_i" from 1 to 3 do {_unit addItemToVest "20Rnd_762x51_Mag";};
				_unit addBackpack "B_TacticalPack_ocamo";
				_unit addItemToBackpack "ToolKit";
				_unit addItemToBackpack "FirstAidKit";
				for "_i" from 1 to 10 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
				for "_i" from 1 to 5 do {_unit addItemToBackpack "6Rnd_45ACP_Cylinder";};
				_unit addHeadgear "H_ShemagOpen_tan";
				_unit addGoggles "G_Combat";

				comment "Add weapons";
				_unit addWeapon "srifle_DMR_06_camo_F";
				_unit addPrimaryWeaponItem "muzzle_snds_B";
				_unit addPrimaryWeaponItem "optic_KHS_hex";
				_unit addPrimaryWeaponItem "bipod_01_F_snd";
				_unit addWeapon "hgun_Pistol_heavy_02_F";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "NVGoggles_OPFOR";
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				life_inv_kabelbinder = 10;
				};};};
	case "76561198026093546": {
		switch (playerSide) do	{
			case west: {/*Revan*/
			comment "Exported from Arsenal by Revan Hiron";

			comment "Remove existing items";
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeUniform _unit;
			removeVest _unit;
			removeBackpack _unit;
			removeHeadgear _unit;
			removeGoggles _unit;

			comment "Add containers";
			_unit forceAddUniform "U_BG_Guerrilla_6_1";
			["U_BG_Guerrilla_6_1"] spawn life_fnc_texturesync;
			for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
			_unit addItemToUniform "20Rnd_762x51_Mag";
			_unit addVest "V_PlateCarrier2_blk";
			for "_i" from 1 to 3 do {_unit addItemToVest "FirstAidKit";};
			for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
			for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_9x21_Mag";};
			_unit addBackpack "B_TacticalPack_blk";
			_unit addItemToBackpack "ToolKit";
			for "_i" from 1 to 10 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "HandGrenade_Stone";};
			_unit addHeadgear "H_Beret_Colonel";
			_unit addGoggles "G_Tactical_Clear";

			comment "Add weapons";
			_unit addWeapon "srifle_EBR_F";
			_unit addPrimaryWeaponItem "muzzle_snds_B";
			_unit addPrimaryWeaponItem "acc_flashlight";
			_unit addPrimaryWeaponItem "optic_AMS";
			_unit addWeapon "hgun_P07_F";
			_unit addHandgunItem "muzzle_snds_L";
			_unit addWeapon "Rangefinder";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemGPS";
			_unit addItemToBackpack "NVGoggles_OPFOR";
			life_inv_redgull = 20;
			life_inv_tbacon = 10;
			life_inv_lockpick = 10;
		};
			case independent: { hint "Kein standard Equipment festgelegt";};
			case civilian: {
				comment "Exported from Arsenal by Revan Hiron";

				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "U_BG_Guerrilla_6_1";
				["U_BG_Guerrilla_6_1"] spawn life_fnc_texturesync;
				_unit addItemToUniform "FirstAidKit";
				for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
				_unit addVest "V_PlateCarrier2_rgr";
				for "_i" from 1 to 14 do {_unit addItemToVest "30Rnd_9x21_Mag";};
				_unit addBackpack "B_TacticalPack_blk";
				for "_i" from 1 to 4 do {_unit addItemToBackpack "FirstAidKit";};
				_unit addItemToBackpack "ToolKit";
				for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_9x21_Mag";};
				_unit addItemToBackpack "SmokeShell";
				_unit addItemToBackpack "SmokeShellOrange";
				_unit addHeadgear "H_Cap_oli_hs";
				_unit addGoggles "G_Bandanna_oli";

				comment "Add weapons";
				_unit addWeapon "SMG_02_F";
				_unit addPrimaryWeaponItem "muzzle_snds_L";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Holosight_smg";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Laserdesignator_03";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles_INDEP";
				};
		};};
	case "76561197969932881": { /*Creedcoder*/
		switch (playerSide) do	{
			case west: {
				_unit addUniform "U_B_CombatUniform_mcam_worn";
				["U_B_CombatUniform_mcam_worn"] spawn life_fnc_texturesync;
				_unit addvest "V_PlateCarrierGL_blk";
				_unit addBackpack "B_Bergen_blk";
				["B_Bergen_blk"] spawn life_fnc_texturesync;
				_unit addGoggles "G_Tactical_Clear";
				_unit addHeadgear "H_Beret_Colonel";
				_weapon = [_unit, "MMG_02_black_F", 3] call BIS_fnc_addWeapon;
				_unit additem "muzzle_snds_338_black";
				_unit additem "optic_KHS_blk";
				_unit additem "ItemGPS";
				_unit additem "NVGoggles_OPFOR";
				_unit additem "ItemRadio";
				_unit additem "Rangefinder";
				_unit additem "Medikit";
				_unit additem "Toolkit";
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				};
			case independent: { hint "Kein standard Equipment festgelegt";};
			case civilian: {
        comment "Remove existing items";
        removeAllWeapons _unit;
        removeAllItems _unit;
        removeAllAssignedItems _unit;
        removeUniform _unit;
        removeVest _unit;
        removeBackpack _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        comment "Add containers";
        _unit forceAddUniform "U_O_CombatUniform_oucamo";
        for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
        for "_i" from 1 to 4 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
        _unit addVest "V_PlateCarrierGL_blk";
        _unit addItemToVest "MineDetector";
        for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
        for "_i" from 1 to 5 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
        for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_blue";};
        _unit addBackpack "B_Carryall_oucamo";
        for "_i" from 1 to 16 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
        _unit addHeadgear "H_HelmetSpecB_blk";
        _unit addGoggles "G_Balaclava_combat";

        comment "Add weapons";
        _unit addWeapon "arifle_MX_SW_Black_F";
        _unit addPrimaryWeaponItem "muzzle_snds_H";
        _unit addPrimaryWeaponItem "acc_flashlight";
        _unit addPrimaryWeaponItem "optic_Nightstalker";
        _unit addPrimaryWeaponItem "bipod_01_F_blk";
        _unit addWeapon "hgun_ACPC2_F";
        _unit addHandgunItem "muzzle_snds_acp";
        _unit addWeapon "Laserdesignator_02";

        comment "Add items";
        _unit linkItem "ItemMap";
        _unit linkItem "ItemCompass";
        _unit linkItem "ItemWatch";
        _unit linkItem "ItemRadio";
        _unit linkItem "B_UavTerminal";
        _unit linkItem "NVGoggles";

        comment "Set identity";
        _unit setFace "WhiteHead_17";
        _unit setSpeaker "Male02ENGB";
        [_unit,"TFAegis"] call bis_fnc_setUnitInsignia;
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				life_inv_kabelbinder = 10;

				_unit addEventHandler ["Killed",{
				removeAllWeapons (_this select 0);
				removeAllItems (_this select 0);
				removeAllAssignedItems (_this select 0);
				removeUniform (_this select 0);
				removeVest (_this select 0);
				removeBackpack (_this select 0);
				removeHeadgear (_this select 0);
				removeGoggles (_this select 0);
				}];
				};};};
	case "76561198064913969": { /*Tim*/hint "Kein standard Equipment festgelegt"; };
	case "76561198149541724": { /*Webster*/
	switch (playerSide) do	{
			case west: {
				comment "Exported from Arsenal by Webster";
				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;
				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam_worn";
				["U_B_CombatUniform_mcam_worn"] spawn life_fnc_texturesync;
				for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
				_unit addVest "V_PlateCarrier1_blk";
				for "_i" from 1 to 5 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 4 do {_unit addItemToVest "16Rnd_9x21_Mag";};
				_unit addBackpack "B_Bergen_blk";
				["B_Bergen_blk"] spawn life_fnc_texturesync;
				_unit addHeadgear "H_Beret_Colonel";
				_unit addGoggles "G_Aviator";
				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_Black_F";
				_unit addPrimaryWeaponItem "optic_SOS";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";
				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles_OPFOR";
				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;};
			case independent: { hint "Kein standard Equipment festgelegt";};
			case civilian: {
				comment "Exported from Arsenal by Larvell";

				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "U_O_SpecopsUniform_ocamo";
				for "_i" from 1 to 5 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
				_unit addVest "V_BandollierB_khk";
				for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
				for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_762x54_Mag";};
				_unit addBackpack "B_Kitbag_mcamo";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "ToolKit";};
				_unit addItemToBackpack "Titan_AA";
				_unit addHeadgear "H_MilCap_ocamo";
				_unit addGoggles "G_Tactical_Black";

				comment "Add weapons";
				_unit addWeapon "srifle_DMR_01_F";
				_unit addPrimaryWeaponItem "muzzle_snds_B";
				_unit addPrimaryWeaponItem "optic_AMS";
				_unit addPrimaryWeaponItem "bipod_01_F_mtp";
				_unit addWeapon "launch_O_Titan_F";
				_unit addWeapon "hgun_Pistol_heavy_01_F";
				_unit addHandgunItem "muzzle_snds_acp";
				_unit addHandgunItem "optic_MRD";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit addItemToUniform "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

				life_inv_redgull = 10;
				life_inv_tbacon = 10;
				life_inv_lockpick = 10;
				life_inv_kabelbinder = 5;
				};};};
	//case "76561198172473687": { /*John*/hint "Kein standard Equipment festgelegt"; };
	//case "76561197960679521": { /*Matt*/hint "Kein standard Equipment festgelegt"; };
	//case "76561198068304864": { /*Vlad*/hint "Kein standard Equipment festgelegt"; };
	default {
		hint "Es wurde kein standard Equipment für dich gefunden.";
			};
 };
