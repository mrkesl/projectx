/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightBlue","_lightleft","_lightright","_leftRed","_backlightleft","_backlightright"];
_vehicle = _this select 0;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightBlue = [0.1, 0.1, 20];

_lightright = "#lightpoint" createVehicle getpos _vehicle;
_lightleft = "#lightpoint" createVehicle getpos _vehicle;
_backlightleft = "#lightpoint" createVehicle getpos _vehicle;
_backlightright = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightleft setLightColor _lightBlue;
_lightright setLightColor _lightBlue;
_backlightleft setLightColor _lightBlue;
_backlightright setLightColor _lightBlue;

_lightleft setLightBrightness 0.6;
_lightright setLightBrightness 0.6;
_backlightleft setLightBrightness 0.6;
_backlightright setLightBrightness 0.6;

_lightleft setLightAmbient [0.1,0.1,1];
_lightright setLightAmbient [0.1,0.1,1];
_backlightleft setLightAmbient [0.1,0.1,1];
_backlightright setLightAmbient [0.1,0.1,1];

_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_backlightleft setLightAttenuation [0.181, 0, 1000, 130];
_backlightright setLightAttenuation [0.181, 0, 1000, 130];

_lightleft setLightIntensity 10;
_lightright setLightIntensity 10;
_backlightleft setLightIntensity 10;
_backlightright setLightIntensity 10;


_lightright setLightFlareSize 0.38;
_lightleft setLightFlareSize 0.38;
_backlightleft setLightFlareSize 0.38;
_backlightright setLightFlareSize 0.38;

_lightright setLightFlareMaxDistance 150;
_lightleft setLightFlareMaxDistance 150;
_backlightleft setLightFlareMaxDistance 150;
_backlightright setLightFlareMaxDistance 150;

_lightleft setLightUseFlare true;
_lightright setLightUseFlare true;
_backlightleft setLightUseFlare true;
_backlightright setLightUseFlare true;

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;
_backlightleft setLightDayLight true;
_backlightright setLightDayLight true;

switch (typeOf _vehicle) do{
	case "C_Offroad_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};
	case "C_Van_01_box_F": //Truck Boxer
    {
    _lightleft lightAttachObject [_vehicle, [-0.85,-0.2,1.35]];
		_lightright lightAttachObject [_vehicle, [0.85,-0.2,1.35]];
		_backlightleft lightAttachObject [_vehicle, [-0.87,-3.48,1.39]];
		_backlightright lightAttachObject [_vehicle, [0.83,-3.48,1.39]];
	};
	case "B_Heli_Light_01_F": //Hummingbird
	{
		deleteVehicle _lightleft;
		deleteVehicle _lightright;
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};

	case "I_Heli_light_03_unarmed_F": //Hellcat
	{
		deleteVehicle _lightleft;
		deleteVehicle _lightright;
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};
};
_leftRed = true;
while{ (alive _vehicle)} do{
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then{
		_leftRed = false;
		_lightright setLightBrightness 0.0;
		_backlightright setLightBrightness 0.0;
		sleep 0.05;
		_lightleft setLightBrightness 50;
		_backlightleft setLightBrightness 50;
	}else{
		_leftRed = true;
		_lightleft setLightBrightness 0.0;
		_backlightleft setLightBrightness 0.0;
		sleep 0.05;
		_lightright setLightBrightness 50;
		_backlightright setLightBrightness 50;
	};
	sleep (_this select 1);
};
deleteVehicle _lightleft;
deleteVehicle _lightright;
deleteVehicle _backlightleft;
deleteVehicle _backlightright;
