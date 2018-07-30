/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightrightback","_lightrightfront","_lightYello","_leftRed","_lightSPOTfront","_lightSPOTback","_brightSPOT","_bright"]; 
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "Right")) exitWith {};
_lightYello = [20, 20, 0];

_lightrightback = "#lightpoint" createVehicle getposATL _vehicle;
_lightrightfront = "#lightpoint" createVehicle getposATL _vehicle;   

_lightrightback setLightColor _lightYello; 
_lightrightfront setLightColor _lightYello; 

_lightrightback setLightBrightness 0;  
_lightrightfront setLightBrightness 0; 

_lightrightback setLightAmbient _lightYello;
_lightrightfront setLightAmbient _lightYello; 

_lightrightback setLightIntensity 0;
_lightrightfront setLightIntensity 0;

_lightrightback setLightFlareMaxDistance 1000;
_lightrightfront setLightFlareMaxDistance 1000;

_lightrightfront setLightUseFlare true;
_lightrightback setLightUseFlare true;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":{	
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};
	case "B_G_Offroad_01_F":{	
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};
	case "B_G_Offroad_01_repair_F":{	
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};		
	case "C_Offroad_01_repair_F":{			
		_lightrightback lightAttachObject [_vehicle, [0.8, -3.0, -0.35]];
		_lightrightfront lightAttachObject [_vehicle, [0.8, 2.1, -0.35]];
	};
	case "B_MRAP_01_F":{
		_lightrightback lightAttachObject [_vehicle, [1.0, 1.40, -0.7]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.90, -4.3, -0.7]];
	};	
	case "C_SUV_01_F":{
		_lightrightback lightAttachObject [_vehicle, [0.50,2.6,-0.5]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.52,-3.1,-0.2]];
	};
	case "B_Quadbike_01_F":{
		_lightrightback lightAttachObject [_vehicle, [0.37,1.0,-0.5]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.37,-1.0,0.0]];
	};	
	
	case "C_Hatchback_01_F":{
		_lightrightback lightAttachObject [_vehicle, [0.75,1.7,-0.3]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.57,-2.3,-0.4]];
	};
	case "C_Hatchback_01_sport_F":{
		_lightrightback lightAttachObject [_vehicle, [0.75,1.7,-0.3]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.57,-2.3,-0.4]];
	};
	case "B_Truck_01_mover_F":{ // hemit ohne alles
		_lightrightback lightAttachObject [_vehicle, [0.78,4.6,-0.1]];
		_lightrightfront lightAttachObject [_vehicle, [0.34,-4.2,-0.55]];
	};
	case "O_MRAP_02_F":{ // ifrit
		_lightrightback lightAttachObject [_vehicle, [0.77,1.6,-0.7]];
		_lightrightfront lightAttachObject [_vehicle, [0.7,-4.5,-0.9]];
	};
	case "I_MRAP_03_F":{
		_lightrightback lightAttachObject [_vehicle, [1,2.25,-0.5]];  
		_lightrightfront lightAttachObject [_vehicle, [1,-3.2,0.3]];
	};
	case"B_Truck_01_transport_F":{
		_lightrightback lightAttachObject [_vehicle, [1.15,-5,-0.3]]; 
		_lightrightfront lightAttachObject [_vehicle, [0.77,5.2,0.3]];
	};	
};

_lightrightback setLightFlareSize 1;
_lightrightfront setLightFlareSize 1;

_lightrightback setLightDayLight true;
_lightrightfront setLightDayLight true;

if (sunOrMoon < 1) then {
	_lightrightback setLightAttenuation [0.1, 100, 100, 1000]; 
	_lightrightfront setLightAttenuation [0.1, 100, 100, 1000]; 
} else {
	_lightrightback setLightAttenuation [0.1, 0, 0, 100000]; 
	_lightrightfront setLightAttenuation [0.1, 0, 0, 100000]; 
};

_leftRed = true;  
while{ (alive _vehicle)} do{ 	
	_bright = (0.1 + sunOrMoon) * 3;
	if((!(_vehicle getVariable "Right"))) exitWith {};	
	if((_vehicle getVariable "Left") OR (_vehicle getVariable "Warn")) exitWith {};	
	if(_leftRed) then{  
		_leftRed = false; 
		
		_lightrightfront setLightBrightness _bright;
		_lightrightback setLightBrightness _bright;  
	}else{  
		_leftRed = true;  

		_lightrightback setLightBrightness 0.0;  
		_lightrightfront setLightBrightness 0.0; 
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightrightback;
deleteVehicle _lightrightfront;