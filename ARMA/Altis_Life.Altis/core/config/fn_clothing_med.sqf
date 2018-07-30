/* 
File: fn_clothingConfig.sqf 
Author: Bryan "Tonic" Boardwine 

Description: 
Master config for clothing shop. 
*/ 
params [["_filter", 0, [0]]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price 
ctrlSetText[3103,"Sanitäter Kleidung"];
switch (_filter) do 
{ 
//Uniforms 
case 0: 
	{ 
		[ 
			["U_I_HeliPilotCoveralls","Notarzt Kleidung",250]
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
			["B_Bergen_mcamo",nil,1250] 
		]; 
	}; 
};