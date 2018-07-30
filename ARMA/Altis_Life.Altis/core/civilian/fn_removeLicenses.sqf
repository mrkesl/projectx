/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
#define fnfind(__var1,__var2) (__var1 find __var2)
#define arraydel(__val) __tmp = (player getVariable ["licenses", []]); __tmp deleteAt fnfind(__tmp,__val); player setVariable ["licenses", __tmp, true];
#define inarray(__val) (__val in (player getVariable ["licenses", []]))

params [["_state", 1, [0]]];

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		/*license_civ_rebel = false;
		license_civ_driver = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;*/
	};
	
	//Jail licenses
	case 1:
	{
		arraydel("civ_gun")
		arraydel("civ_rebel")
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(inarray("civ_driver") OR inarray("civ_truck")) then {
			arraydel("civ_driver")
			arraydel("civ_truck")
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(inarray("civ_gun")) then {
			arraydel("civ_gun")
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	//ADDED by grimm, for removing licenses on radar script
	case 4:
	{
		if(inarray("civ_driver") OR inarray("civ_truck")) then {
			arraydel("civ_driver")
			arraydel("civ_truck")
			systemChat localize "STR_Civ_LicenseRemove_1a";
		};
	};
};