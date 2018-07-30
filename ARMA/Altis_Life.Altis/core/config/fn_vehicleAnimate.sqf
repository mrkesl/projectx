/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwin
	Mod: Ragebone	
	Description:
	Pass what you want to be animated.
*/
params [["_vehicle", Objnull, [ObjNull]], ["_animate", "", ["",[]]], ["_preset", false, [false]]];
if(isnull _vehicle) exitwith {}; //FUCK

if(!_preset) then{
	if(count _animate > 1) then{
		{
			_vehicle animate[_x select 0,_x select 1];
		} foreach _animate;
	}else{
		_vehicle animate[_animate select 0,_animate select 1];
	};
}else{
	switch (_animate) do{
		case "civ_littlebird":{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["addDoors",1];
			_vehicle animate ["addBenches",0];
			_vehicle animate ["addTread",0];
			_vehicle animate ["AddCivilian_hide",1];
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};
		case "other_littlebird":{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["addDoors",0];
			_vehicle animate ["addBenches",1];
			_vehicle animate ["addTread",1];
			_vehicle animate ["AddCivilian_hide",0]; // what does this do ?
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};		
		case "service_truck":{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			};
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
		};			
		case "med_offroad":{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			};
			_vehicle animate ["HidePolice", 0];
			_vehicle setVariable["lights",false,true];
		};		
		case "cop_offroad":{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			};
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];
			_vehicle setVariable["lights",false,true];
		};		
	};
};