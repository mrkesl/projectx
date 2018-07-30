/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the licenses to the cop.
*/
params [["_cop", ObjNull, [ObjNull]]];
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
//Licenses
{
		_licenses = _licenses + ([_x] call life_fnc_varToStr) + "<br/>";
} foreach (player getVariable["licenses",[]]);

if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

[profileName,_licenses] remoteExec ["life_fnc_licensesRead", _cop, false];
