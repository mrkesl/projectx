/*
	File: fn_clothing_dive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
params [["_filter", 0, [0]]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Steve's Taucherladen"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_Wetsuit",nil,2000]
		];
	};
	
	//Hats
	case 1:
	{
		[
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Diving",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB",nil,5000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};