/*
File: fn_clothingConfig.sqf
Author: Bryan "Tonic" Boardwine

Description:
Master config for clothing shop.
*/
params [["_filter", 0, [0]]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price
ctrlSetText[3103,"AAC Kleidung"];
switch (_filter) do
{
//Uniforms
case 0:
	{
		[
			//["C_man_p_beggar_F","AAC Uniform",250] //ist doch eine Einheit und keine Kleidung??? /Sears
			["U_B_HeliPilotCoveralls","AAC Uniform",250] //entsprechende Kleidung der Einheit C_man_p_beggar_F
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
		];
	};

	//Vest
	case 3:
	{
		[
		];
	};

//Backpacks
	case 4:
	{
		[
			["B_Bergen_sgg",nil,1250]
		];
	};
};
