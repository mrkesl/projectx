/* 
File: fn_clothingConfig.sqf 
Author: Bryan "Tonic" Boardwine 

Description: 
Master config for clothing shop. 
*/ 
params [["_filter", 0, [0]]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price 
ctrlSetText[3103,"Verrüchter Wissenschaftler"];
switch (_filter) do 
{ 
//Uniforms 
case 0: 
	{ 
		[ 
					["U_C_Scientist","Strahlenanzug",100000]
		]; 
	}; 
	//Hats
	case 1:
	{
		[			
					["H_PilotHelmetFighter_B","Strahlenschutzhelm",50000]
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
		]; 
	}; 
};