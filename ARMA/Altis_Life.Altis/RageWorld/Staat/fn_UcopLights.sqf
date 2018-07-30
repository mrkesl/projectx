/*
	File: fn_UcopLights.sqf
	Author: mindstorm, modified by Adanteh
	MOD Ragebone!!
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightBlue","_light","_leftRed"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightBlue = [0.1, 0.1, 20];
_light = "#lightpoint" createVehicle getPosASL  _vehicle; 

_light setLightColor _lightBlue; 
_light setLightBrightness 0.2;  
_light setLightAmbient [0.1, 0.1, 20]; // war  [0.1,0.1,1];
_light setLightAttenuation [0.1, 0, 4.31918e-005, 130];
_light setLightIntensity 10;
_light setLightFlareSize 0.78;
_light setLightFlareMaxDistance 150;
_light setLightUseFlare true;
switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{
		_light lightAttachObject [_vehicle, [-0.6,0.57,0.27]];		
	};
	case "C_SUV_01_F":{
		_light lightAttachObject [_vehicle, [-0.6, -0.2, 0.4]];		
	};
	case "B_Quadbike_01_F":{
		_light lightAttachObject [_vehicle, [0.0, 0.0, 0.30]];		
	}; 
	case "C_Hatchback_01_F":{
		_light lightAttachObject [_vehicle, [0.0, 0.0, 0.30]];		
	}; 
	case "C_Hatchback_01_sport_F":{
		_light lightAttachObject [_vehicle, [0.0, 0.0, 0.30]];		
	}; 	
};
_light setLightDayLight true;
_leftRed = true;  
while{ (alive _vehicle)} do{
	if(!(_vehicle getVariable "lights")) exitWith {};	
	if(_leftRed) then{  
		_leftRed = false;				
		_light setLightBrightness 10;
		sleep 0.45;
		_light setLightBrightness 0.0;		
	}else{  
		_leftRed = true;  
		_light setLightBrightness 10;
		sleep 0.9;
		_light setLightBrightness 0.0;	
	};  
	sleep (_this select 1);  
};  
deleteVehicle _light;