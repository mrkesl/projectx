/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the cops out with the default gear.
*/
private["_handle","_coplevel"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
_coplevel = player getVariable["cop_level", 0];
if(_coplevel < 4) then
	{
		comment "Exported from Arsenal by Revan Hiron";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;

		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam_worn";
		["U_B_CombatUniform_mcam_worn"] spawn life_fnc_texturesync;
		player addVest "V_TacVest_blk";
		for "_i" from 1 to 5 do {player addItemToVest "FirstAidKit";};
		player addBackpack "B_Kitbag_rgr";
		["B_Kitbag_rgr"] spawn life_fnc_texturesync;
		for "_i" from 1 to 2 do {player addItemToBackpack "ToolKit";};
		for "_i" from 1 to 5 do {player addItemToBackpack "30Rnd_9x21_Mag";};
		player addHeadgear "H_HelmetB_black";

		comment "Add weapons";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";
		life_inv_redgull = 20;
		life_inv_tbacon = 10;
		life_inv_lockpick = 5;
	};
if(_coplevel < 6) then
	{
		comment "Exported from Arsenal by Revan Hiron";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;

		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam_worn";
		["U_B_CombatUniform_mcam_worn"] spawn life_fnc_texturesync;
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Kitbag_rgr";
		["B_Kitbag_rgr"] spawn life_fnc_texturesync;
		for "_i" from 1 to 2 do {player addItemToBackpack "ToolKit";};
		for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 5 do {player addItemToBackpack "30Rnd_9x21_Mag";};
		player addHeadgear "H_HelmetSpecB_blk";

		comment "Add weapons";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";
		life_inv_redgull = 20;
		life_inv_tbacon = 10;
		life_inv_lockpick = 5;
	};
if(_coplevel > 6) then
	{
		comment "Exported from Arsenal by Revan Hiron";

		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;

		comment "Add containers";
		player forceAddUniform "U_BG_Guerrilla_6_1";
		["U_BG_Guerrilla_6_1"] spawn life_fnc_texturesync;
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "30Rnd_9x21_Mag";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		["B_Bergen_blk"] spawn life_fnc_texturesync;
		for "_i" from 1 to 2 do {player addItemToBackpack "ToolKit";};
		for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 5 do {player addItemToBackpack "30Rnd_9x21_Mag";};
		player addHeadgear "H_Beret_02";

		comment "Add weapons";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		life_inv_redgull = 20;
		life_inv_tbacon = 10;
		life_inv_lockpick = 5;
	};
[] call life_fnc_saveGear;
