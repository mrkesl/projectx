#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
params [["_filter", 0, [0]]];
private["_ret"];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

private["_hasMmDlc"];
_hasMmDlc = (332350 in (getDLCs 1));
// Variable für Marksmen DLC Abfrage

//Shop Title Name
ctrlSetText[3103,"Rumpelkiste der Nationalgarde"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(_hasMmDlc)then{
				_ret pushBack ["U_Rangemaster","Gardisten Uniform",25];
				_ret pushBack ["U_B_CombatUniform_mcam_worn","Gardisten Uniform",350];

			if((player getVariable ["cop_level", 0]) > 3) then
			{
				_ret pushBack ["U_BG_Guerrilla_6_1","Gardisten Uniform",350];
				_ret pushBack ["U_B_FullGhillie_lsh","Ghillie",550];
				_ret pushBack ["U_I_Wetsuit","Taucheranzug",100];
				_ret pushBack ["U_BG_Guerilla3_1","Zivilstreife",500];
			};
		}else{
				_ret pushBack ["U_Rangemaster","Gardisten Uniform",25];
				_ret pushBack ["U_B_CombatUniform_mcam_worn","Gardisten Uniform",350];
				if((player getVariable ["cop_level", 0]) > 3) then
				{
					_ret pushBack ["U_BG_Guerrilla_6_1","Gardisten Uniform",350];
					_ret pushBack ["U_I_Wetsuit","Taucheranzug",100];
					_ret pushBack ["U_BG_Guerilla3_1","Zivilstreife",500];
			};
		};
		if((player getVariable["cop_level",0]) == 8) then {
			_ret pushBack ["U_O_OfficerUniform_ocamo", "Majors Uniform", 10000];
		};
	};

	//Hats
	case 1:
	{
		if(_hasMmDlc)then{

				_ret pushBack ["H_CrewHelmetHeli_B","Gasmaske",200];
				_ret pushBack ["H_HelmetB_light_black",nil,150];


			if((player getVariable ["cop_level", 0]) > 3) then
			{
				_ret pushBack ["H_Watchcap_blk",nil,120];
				_ret pushBack ["H_Beret_blk_POLICE",nil,120];
				_ret pushBack ["H_Cap_oli_hs",nil,120];
				_ret pushBack ["H_Cap_blk",nil,120];
				_ret pushBack ["H_Beret_02",nil,120];
				_ret pushBack ["H_HelmetSpecB_blk",nil,120];
			};



			if((player getVariable ["cop_level", 0]) > 7) then
			{
				_ret pushBack ["H_Beret_Colonel",nil,120];
			};

		}else{

				_ret pushBack ["H_CrewHelmetHeli_B","Gasmaske",200];
				_ret pushBack ["H_HelmetB_light_black",nil,150];


			if((player getVariable ["cop_level", 0]) > 3) then
			{
				_ret pushBack ["H_Watchcap_blk",nil,120];
				_ret pushBack ["H_Beret_blk_POLICE",nil,120];
				_ret pushBack ["H_Cap_oli_hs",nil,120];
				_ret pushBack ["H_Cap_blk",nil,120];
				_ret pushBack ["H_Beret_02",nil,120];
				_ret pushBack ["H_HelmetSpecB_blk",nil,120];
			};



			if((player getVariable ["cop_level", 0]) > 7) then
			{
				_ret pushBack ["H_Beret_Colonel",nil,120];
			};

		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Diving","Taucherbrille",500],
			["G_Tactical_Clear",nil,200]

		];
		if((player getVariable ["cop_level", 0]) > 2) then
		{
			_ret pushBack ["G_Balaclava_blk","Sturmhaube",400];
		};

	};

	//Vest
	case 3:
	{
		if(_hasMmDlc)then{
			_ret pushBack ["V_Rangemaster_belt",nil,800];
			_ret pushBack ["V_TacVest_blk",nil,1500];
			if((player getVariable ["cop_level", 0]) > 1) then
			{
				_ret pushBack ["V_PlateCarrier2_rgr",nil,1500];
				_ret pushBack ["V_RebreatherB",nil,1200];
			};
			if((player getVariable ["cop_level", 0]) > 4) then
			{
				_ret pushBack ["V_Chestrig_blk",nil,1500];
				_ret pushBack ["V_TacVest_blk_POLICE",nil,1500];
				_ret pushBack ["V_PlateCarrierSpec_blk",nil,1500];
			};
			if((player getVariable ["cop_level", 0]) > 5) then
			{
				_ret pushBack ["V_PlateCarrier1_blk",nil,1500];
				_ret pushBack ["V_PlateCarrierIAGL_dgtl",nil,1500];
				_ret pushBack ["V_PlateCarrierIA1_dgtl",nil,1500];
				_ret pushBack ["V_PlateCarrierGL_blk",nil,1500];
			};

		}else{
			_ret pushBack ["V_Rangemaster_belt",nil,800];
			_ret pushBack ["V_TacVest_blk",nil,1500];
			if((player getVariable ["cop_level", 0]) > 1) then
			{
				_ret pushBack ["V_PlateCarrier2_rgr",nil,1500];
				_ret pushBack ["V_RebreatherB",nil,1200];
			};
			if((player getVariable ["cop_level", 0]) > 4) then
			{
				_ret pushBack ["V_Chestrig_blk",nil,1500];
				_ret pushBack ["V_TacVest_blk_POLICE",nil,1500];
			};
			if((player getVariable ["cop_level", 0]) > 5) then
			{
				_ret pushBack ["V_PlateCarrier1_blk",nil,1500];
				_ret pushBack ["V_PlateCarrierIAGL_dgtl",nil,1500];
				_ret pushBack ["V_PlateCarrierIA1_dgtl",nil,1500];
			};
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_UAV_01_backpack_F",nil,12000],
			["B_TacticalPack_blk",nil,800],
			["B_Bergen_blk",nil,800],
			["B_Kitbag_rgr",nil,800]
		];
		if((player getVariable ["cop_level", 0]) > 3) then
		{
			_ret pushBack ["B_Carryall_cbr","Zivilrucksack",3000]
		};
	};
};

_ret;
