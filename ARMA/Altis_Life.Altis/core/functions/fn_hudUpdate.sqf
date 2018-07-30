#include <macro.h>
#define IDD_LIFE_MAIN_DISP 12203
#define IDC_LIFE_BAR_FOOD 12200
#define IDC_LIFE_BAR_WATER 12201
#define IDC_LIFE_BAR_HEALTH 12202
#define IDC_LIFE_FOOD_TEXT 11000
#define IDC_LIFE_WATER_TEXT 11001
#define IDC_LIFE_HEALTH_TEXT 11002
#define IDC_LIFE_GOD_TEXT 11003
#define GVAR_UINS uiNamespace getVariable

#define LIFEdisplay (GVAR_UINS ["playerHUD",displayNull])
#define LIFEctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)
/*
File: fn_hudUpdate.sqf
Author: Dillon "Itsyuka" Modine-Thuen

Description:
Updates the HUD when it needs to.
*/
private["_ui","_gtext","_goodmood"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};

if((lar_has_god == 1) || (lar_veh_god == 1)) then {_gtext = "Godmode oder Cargod ist noch aktiv!";LIFEctrl(IDC_LIFE_GOD_TEXT) ctrlsetText format["%1", _gtext];}else{_gtext = "";LIFEctrl(IDC_LIFE_GOD_TEXT) ctrlsetText format["%1", _gtext];};

LIFEctrl(IDC_LIFE_BAR_FOOD) progressSetPosition (1 / (100 / (player getvariable["hunger", 100])));
LIFEctrl(IDC_LIFE_BAR_WATER) progressSetPosition (1 / (100 / (player getvariable["thirst", 100])));
LIFEctrl(IDC_LIFE_BAR_HEALTH) progressSetPosition (1 - (damage player));

LIFEctrl(IDC_LIFE_FOOD_TEXT) ctrlsetText format["%1", (player getvariable["hunger", 100])];
LIFEctrl(IDC_LIFE_WATER_TEXT) ctrlsetText format["%1", (player getvariable["thirst", 100])];
LIFEctrl(IDC_LIFE_HEALTH_TEXT) ctrlsetText format["%1", round((1 - (damage player)) * 100)];
