/*
	File: fn_aacLights.sqf
	Author: mindstorm, modified by Adanteh 
	Moded by: RAGEBONE
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to vehicles, specifically the offroad.
*/
Private ["_pos","_vehicle","_lightleft","_lightright","_leftYello","_leftRed"];
_vehicle = _this select 0;
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightYello = [20, 20, 0.1];
_pos = getposasl _vehicle; 
_lightleft = "#lightpoint" createVehicle _pos; 
_lightright = "#lightpoint" createVehicle _pos;     
sleep 0.02;
_lightleft setLightColor _lightYello; 
_lightright setLightColor _lightYello; 
_lightleft setLightBrightness 0.2;  
_lightright setLightBrightness 0.2;  
_lightleft setLightAmbient [20,20,0.1];
_lightright setLightAmbient [20,20,0.1]; 
switch (typeOf _vehicle) do{
	case "B_G_Offroad_01_repair_F":{	
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]]; 
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
		_lightleft setLightFlareSize 0.58;	
		_lightright setLightFlareSize 0.58;	
	};	
	case "C_Offroad_01_repair_F":{	
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]]; 
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
		_lightleft setLightFlareSize 0.58;		
		_lightright setLightFlareSize 0.58;	
	};	
};
_lightleft setLightAttenuation [0.1, 0, 1000, 130]; 
_lightright setLightAttenuation [0.1, 0, 1000, 130]; 
_lightleft setLightIntensity 10;
_lightright setLightIntensity 10;

_lightleft setLightFlareMaxDistance 150;
_lightright setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;
_lightright setLightUseFlare true;

_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;  
while{ (alive _vehicle)} do{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then{  
		_leftRed = false;  
		_lightright setLightBrightness 0.0;  
		sleep 0.05;		
		_lightleft setLightBrightness 10;  
	}else{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		sleep 0.05;		
		_lightright setLightBrightness 10;  
		
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;