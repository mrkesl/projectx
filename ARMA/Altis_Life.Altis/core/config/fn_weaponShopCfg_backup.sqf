#include <macro.h>
#define inarray(__val) (__val in (player getVariable ["licenses", []]))
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
params [["_shop", "", [""]]];
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
if ((playerSide == west) && (_shop == "cop_shop")) exitWith {[] call life_fnc_copgear;};
private["_hasMmDlc"];
_hasMmDlc = (332350 in (getDLCs 1));
// Variable für Marksmen DLC Abfrage

switch(_shop) do
{
	case "tankshop":
	{
			["Tanstelle",
				[
					["ToolKit",nil,10000],
					["FirstAidKit",nil,8000],
					["ItemMap",nil,5000],
					["ItemGPS",nil,10000],
					["NVGoggles",nil,20000],
					["ItemRadio","Handy",100000]
				]
			];
	};
	case "basic_ad"://AAC Shop
	{
	switch(true) do
		{
			case ((player getVariable["aac_level", false]) < 1): {"Du bist leider kein AAC Mitarbeiter."};
			default
			{
				["AAC Shop",
					[
						["ToolKit",nil,100],
						["FirstAidKit",nil,500],
						["ItemMap",nil,200],
						["ItemGPS",nil,400],
						["NVGoggles",nil,2000],
						["ItemRadio","Handy",100]
					]
				];
			};
		};
	};
	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"Du bist kein Notarzt."};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["Rangefinder",nil,2000]
					]
				];
			};
		};
	};
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!(inarray("civ_rebel"))): {"Du hast kein Rebellenausbildung!"};
			default
			{
				["Separatisten Waffenlager",
					[
						["hgun_ACPC2_F",nil,11500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["arifle_SDAR_F",nil,150000],
						["arifle_TRG20_F",nil,150000],
						["Rangefinder",nil,8000],
						["acc_flashlight",nil,5000],
						["ItemRadio","Handy",100],
						["9Rnd_45ACP_Mag",nil,500],
						["6Rnd_45ACP_Cylinder",nil,500],
						["30Rnd_556x45_Stanag",nil,1000]
					]
				];
			};
		};
	};
	case "waffenh":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!(inarray("civ_rebel"))): {"Du hast keine Rebellenausbildung!"};
			default
			{
			if(_hasMmDlc)then{
				["Illegaler Waffenhändler DLC",
					[
						["arifle_Mk20_plain_F",nil,300000],
						["arifle_Mk20C_plain_F",nil,280000],
						["srifle_DMR_01_F",nil,400000],
						["arifle_Katiba_F",nil,400000],
						["arifle_Katiba_C_F",nil,380000],
						["srifle_DMR_06_camo_F",nil,800000],
						["srifle_DMR_03_F",nil,900000],
						["arifle_MXC_F",nil,920000],
						["arifle_MX_F",nil,950000],
						["LMG_Mk200_F",nil,1500000],
						["srifle_EBR_F",nil,1950000],
						["hgun_Pistol_heavy_01_F",nil,40000],
						["30Rnd_556x45_Stanag",nil,600],
						["30Rnd_65x39_caseless_green",nil,800],
						["30Rnd_65x39_caseless_mag",nil,800],
						["20Rnd_762x51_Mag",nil,1000],
						["200Rnd_65x39_cased_Box",nil,1000],
						["200Rnd_65x39_cased_Box_Tracer",nil,1000],
						["10Rnd_762x54_Mag",nil,900],
						["11Rnd_45ACP_Mag",nil,300],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_B",nil,5000],
						["muzzle_snds_M",nil,5000],
						["bipod_01_F_snd",nil,20000],
						["bipod_02_F_blk",nil,20000],
						["bipod_03_F_blk",nil,20000],
						["bipod_01_F_mtp",nil,20000],
						["optic_Hamr",nil,10000],
						["optic_MRCO",nil,10000],
						["optic_NVS",nil,10000],
						["optic_KHS_hex",nil,10000],
						["optic_KHS_blk",nil,10000],
						["optic_AMS",nil,10000],
						["optic_AMS_snd",nil,10000],
						["optic_AMS_khk",nil,10000],
						["acc_flashlight",nil,5000],
						["acc_pointer_IR",nil,5000],
						["Rangefinder",nil,8000],
						["ItemRadio","Handy",100]
					]
				];}else{
				["Illegaler Waffenhändler",
					[
						["arifle_Mk20_plain_F",nil,300000],
						["arifle_Mk20C_plain_F",nil,280000],
						["srifle_DMR_01_F",nil,400000],
						["arifle_Katiba_F",nil,400000],
						["arifle_Katiba_C_F",nil,380000],
						["arifle_MXC_F",nil,920000],
						["arifle_MX_F",nil,950000],
						["LMG_Mk200_F",nil,1500000],
						["srifle_EBR_F",nil,1950000],
						["hgun_Pistol_heavy_01_F",nil,40000],
						["30Rnd_556x45_Stanag",nil,600],
						["30Rnd_65x39_caseless_green",nil,800],
						["30Rnd_65x39_caseless_mag",nil,800],
						["20Rnd_762x51_Mag",nil,1000],
						["10Rnd_762x54_Mag",nil,900],
						["200Rnd_65x39_cased_Box",nil,1000],
						["200Rnd_65x39_cased_Box_Tracer",nil,1000],
						["11Rnd_45ACP_Mag",nil,300],
						["muzzle_snds_acp",nil,5000],
						["muzzle_snds_H",nil,5000],
						["muzzle_snds_B",nil,5000],
						["muzzle_snds_M",nil,5000],
						["optic_MRD",nil,7500],
						["optic_Hamr",nil,10000],
						["optic_MRCO",nil,10000],
						["optic_NVS",nil,10000],
						["acc_flashlight",nil,5000],
						["acc_pointer_IR",nil,5000],
						["Rangefinder",nil,8000],
						["ItemRadio","Handy",100]
					]
				];
				};
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!(inarray("civ_gun"))): {"Du hast keine Waffenlizenz!"};
			default
			{
				["Keckler und Hoch",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["SMG_01_F",nil,30000],
						["SMG_02_F",nil,50000],
						["optic_ACO_grn_smg",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],
						["30Rnd_9x21_Mag",nil,200],
						["V_Rangemaster_belt",nil,4900],
						["acc_flashlight",nil,5000],
						["ItemRadio","Handy",100]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			default
			{
				["Gang Waffenlager",
					[
						["hgun_ACPC2_F",nil,11500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["arifle_TRG20_F",nil,150000],
						["arifle_Mk20_F",nil,180000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_MRCO",nil,8000],
						["optic_Hamr",nil,7500],
						["acc_pointer_IR",nil,2000],
						["acc_flashlight",nil,1000],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,200],
						["30Rnd_556x45_Stanag",nil,300],
						["ItemRadio","Handy",100]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Eddys Allerlei",
			[
				["ItemRadio","Handy",100],
				["Binocular",nil,150],
				["ItemGPS",nil,1000],
				["ToolKit",nil,500],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2500],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
