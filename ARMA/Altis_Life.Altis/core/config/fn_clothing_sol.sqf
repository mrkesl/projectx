/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
params [["_filter", 0, [0]]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Blackwater Kleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_Competitor","Polohemd",3000],
			["U_B_SpecopsUniform_sgg","Blackwater Kampfanzug",5000],
			["U_O_Wetsuit","Taucheranzug",5000]
			
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_Cap_blk",nil,120],
			["H_Cap_oli_hs",nil,120],
			["H_Watchcap_blk",nil,120]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Diving","Taucherbrille",500],
			["G_Balaclava_blk","Sturmhaube",400],
			["G_Tactical_Clear",nil,200]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_blk",nil,1500],
			["V_Chestrig_blk",nil,1500],
			["V_RebreatherIA",nil,10000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Carryall_ocamo",nil,2500]
			
		];
	};
};