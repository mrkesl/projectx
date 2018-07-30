/*
	File: fn_copLights.sqf
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

	Description:
	Adds the light effect to cop vehicles.

*/
Private ["_vehicle","_frontlightleft","_frontlightright","_toplightleft","_toplightright","_backlightleft","_backlightright", "_leftRed", "_dayOrNight"];
_vehicle = _this select 0;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};

// ---------- Left-Lights ----------
_frontlightleft = "#lightpoint" createVehicle getpos _vehicle;
_toplightleft = "#lightpoint" createVehicle getpos _vehicle;
_backlightleft = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_frontlightleft setLightColor [0.1, 0.1, 20];
_frontlightleft setLightBrightness 0.6;
_frontlightleft setLightAmbient [0.1,0.1,1];
_frontlightleft setLightAttenuation [0, 0, 0, 100];
_frontlightleft setLightIntensity 2;
_frontlightleft setLightFlareSize 0.38;
_frontlightleft setLightFlareMaxDistance 150;
_frontlightleft setLightUseFlare true;
_frontlightleft setLightDayLight true;
_toplightleft setLightColor [0.1, 0.1, 20];
_toplightleft setLightBrightness 0.6;
_toplightleft setLightAmbient [0.1,0.1,1];
_toplightleft setLightAttenuation [0, 0, 0, 250];
_toplightleft setLightIntensity 2;
_toplightleft setLightFlareSize 0.38;
_toplightleft setLightFlareMaxDistance 150;
_toplightleft setLightUseFlare true;
_toplightleft setLightDayLight true;
_backlightleft setLightColor [0.1, 0.1, 20];
_backlightleft setLightBrightness 0.6;
_backlightleft setLightAmbient [0.1,0.1,1];
_backlightleft setLightAttenuation [0, 0, 0, 250];
_backlightleft setLightIntensity 2;
_backlightleft setLightFlareSize 0.38;
_backlightleft setLightFlareMaxDistance 150;
_backlightleft setLightUseFlare true;
_backlightleft setLightDayLight true;
// ---------- END Left-Lights ----------

// --------------------------------------------------------------------------------

// ---------- Right-Lights ----------
_frontlightright = "#lightpoint" createVehicle getpos _vehicle;
_toplightright = "#lightpoint" createVehicle getpos _vehicle;
_backlightright = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_frontlightright setLightColor [0.1, 0.1, 20];
_frontlightright setLightBrightness 0.6;
_frontlightright setLightAmbient [0.1,0.1,1];
_frontlightright setLightAttenuation [0, 0, 0, 250];
_frontlightright setLightIntensity 2;
_frontlightright setLightFlareSize 0.38;
_frontlightright setLightFlareMaxDistance 150;
_frontlightright setLightUseFlare true;
_frontlightright setLightDayLight true;
_toplightright setLightColor [0.1, 0.1, 20];
_toplightright setLightBrightness 0.6;
_toplightright setLightAmbient [0.1,0.1,1];
_toplightright setLightAttenuation [0, 0, 0, 250];
_toplightright setLightIntensity 2;
_toplightright setLightFlareSize 0.38;
_toplightright setLightFlareMaxDistance 150;
_toplightright setLightUseFlare true;
_toplightright setLightDayLight true;
_backlightright setLightColor [0.1, 0.1, 20];
_backlightright setLightBrightness 0.6;
_backlightright setLightAmbient [0.1,0.1,1];
_backlightright setLightAttenuation [0, 0, 0, 250];
_backlightright setLightIntensity 2;
_backlightright setLightFlareSize 0.38;
_backlightright setLightFlareMaxDistance 150;
_backlightright setLightUseFlare true;
_backlightright setLightDayLight true;
// ---------- END Right-Lights ----------

// ---------------------------------------- Lightpositions ----------------------------------------
switch (typeOf _vehicle) do
{
	case "C_Hatchback_01_F": //Hatchback
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.65, 2, -0.9]];
		_frontlightright lightAttachObject [_vehicle,[0.65, 2, -0.9]];
		_toplightleft lightAttachObject [_vehicle,[-0.58, -0.6, 0.18]];
		_toplightright lightAttachObject [_vehicle,[0.55, -0.6, 0.18]];
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};

	case "C_Hatchback_01_sport_F": //Hatchback Sport
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.65, 2, -0.9]];
		_frontlightright lightAttachObject [_vehicle,[0.65, 2, -0.9]];
		_toplightleft lightAttachObject [_vehicle,[-0.58, -0.6, 0.18]];
		_toplightright lightAttachObject [_vehicle,[0.55, -0.6, 0.18]];
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};

	case "C_Offroad_01_F": //Offroader
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.24, 2.5, -0.50]];
		_frontlightright lightAttachObject [_vehicle,[0.15, 2.5, -0.50]];
		_toplightleft lightAttachObject [_vehicle,[-0.42, 0.0, 0.56]];
		_toplightright lightAttachObject [_vehicle,[0.35, 0.0, 0.56]];
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};
	case "I_Truck_02_covered_F": //Zamak
	{
		_frontlightleft lightAttachObject [_vehicle,[-1.15,3.4,0.42]];
		deleteVehicle _frontlightright;
		deleteVehicle _backlightright;
		deleteVehicle _backlightleft;
		deleteVehicle _toplightright;
		deleteVehicle _toplightleft;
	};
	case "O_MRAP_02_F": //Ifrit
	{
		_frontlightleft lightAttachObject [_vehicle,[-1.15, -1.55, 0.35]];
		_frontlightright lightAttachObject [_vehicle,[1.15, -1.55, 0.35]];
		_backlightright lightAttachObject [_vehicle,[1.4,-4.05,0.3]];
		_backlightleft lightAttachObject [_vehicle,[-1.4,-4.05,0.3]];
		deleteVehicle _toplightright;
		deleteVehicle _toplightleft;
	};
	case "C_SUV_01_F": //Police-SUV
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.4, 2.3, -0.50]];
		_frontlightright lightAttachObject [_vehicle,[0.32, 2.3, -0.50]];
		_toplightleft lightAttachObject [_vehicle,[-0.50,-1.2,0.42]];
		_toplightright lightAttachObject [_vehicle,[0.50,-1.2,0.42]];
		_backlightleft lightAttachObject [_vehicle,[-0.49,-2.9,-0.23]];
		_backlightright lightAttachObject [_vehicle,[0.49,-2.9,-0.23]];
	};

	case "B_MRAP_01_F": //Hunter
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.825,-0.95,0.6]];
		_frontlightright lightAttachObject [_vehicle,[0.825,-0.95,0.6]];
		_backlightleft lightAttachObject [_vehicle,[-0.95,-2.75,0.6]];
		_backlightright lightAttachObject [_vehicle,[0.95,-2.75,0.6]];
		deleteVehicle _toplightleft;
		deleteVehicle _toplightright;
	};
	case "I_MRAP_03_F": //Strider
	{
		_frontlightleft lightAttachObject [_vehicle,[-1.04,0.58,0.45]];
		_backlightleft lightAttachObject [_vehicle,[0,-3,0.36]];
		deleteVehicle _toplightleft;
		deleteVehicle _toplightright;
		deleteVehicle _backlightright;
		deleteVehicle _frontlightright;
	};
	case "B_MRAP_01_hmg_F": //Armored and HMG-Armed Hunter
	{
		_frontlightleft lightAttachObject [_vehicle,[-1.08, 1.5, -1.20]];
		_frontlightright lightAttachObject [_vehicle,[1.08, 1.5, -1.20]];
		_toplightleft lightAttachObject [_vehicle,[-1, -2.8, 0]];
		_toplightright lightAttachObject [_vehicle,[1, -2.8, 0]];
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};
	case "B_Heli_Light_01_F": //Hummingbird
	{
		deleteVehicle _frontlightleft;
		deleteVehicle _toplightleft;
		deleteVehicle _backlightleft;
		deleteVehicle _frontlightright;
		deleteVehicle _toplightright;
		deleteVehicle _backlightright;
	};

	case "I_Heli_light_03_unarmed_F": //Hellcat
	{
		deleteVehicle _frontlightleft;
		deleteVehicle _toplightleft;
		deleteVehicle _backlightleft;
		deleteVehicle _frontlightright;
		deleteVehicle _toplightright;
		deleteVehicle _backlightright;
	};

	case "B_Heli_Transport_01_F": //Ghosthawk
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.53, 2.26, -1.78]];
		_frontlightright lightAttachObject [_vehicle,[0.65, 2.26, -1.78]];
		deleteVehicle _toplightleft;
		deleteVehicle _toplightright;
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};

	case "B_Boat_Armed_01_minigun_F": //Armored and Minigun-Armed Policeboat
	{
		_frontlightleft lightAttachObject [_vehicle,[-0.65, 6.3, -1.38]];
		_frontlightright lightAttachObject [_vehicle,[0.65, 6.3, -1.38]];
		deleteVehicle _toplightleft;
		deleteVehicle _toplightright;
		deleteVehicle _backlightleft;
		deleteVehicle _backlightright;
	};
	case "O_APC_Wheeled_02_rcws_F": //Marid
	{
		deleteVehicle _frontlightleft;
		deleteVehicle _toplightleft;
		deleteVehicle _backlightleft;
		deleteVehicle _frontlightright;
		deleteVehicle _toplightright;
		deleteVehicle _backlightright;
	};
};
// --------------------------------------------------------------------------------
if (sunOrMoon < 1) then {
	_dayOrNight = 3;
} else {
	_dayOrNight = 50;
};

_leftRed = true;
while{ (alive _vehicle)} do
{
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then
	{
		_leftRed = false;
		_frontlightright setLightBrightness 0.0;
		_toplightright setLightBrightness 0.0;
		_backlightright setLightBrightness 0.0;
		uisleep 0.05;
		_frontlightleft setLightBrightness _dayOrNight;
		_toplightleft setLightBrightness _dayOrNight;
		_backlightleft setLightBrightness _dayOrNight;
	}
		else
	{
		_leftRed = true;
		_frontlightleft setLightBrightness 0.0;
		_toplightleft setLightBrightness 0.0;
		_backlightleft setLightBrightness 0.0;
		uisleep 0.05;
		_frontlightright setLightBrightness _dayOrNight;
		_toplightright setLightBrightness _dayOrNight;
		_backlightright setLightBrightness _dayOrNight;
	};
	uisleep (_this select 1);
};

deleteVehicle _frontlightleft;
deleteVehicle _toplightleft;
deleteVehicle _backlightleft;
deleteVehicle _frontlightright;
deleteVehicle _toplightright;
deleteVehicle _backlightright;
