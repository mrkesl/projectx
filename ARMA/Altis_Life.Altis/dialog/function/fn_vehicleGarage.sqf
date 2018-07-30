/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
params [["_type", "", [""]], ["_spawnPos", ObjNull, [ObjNull]]];
private "_dir";

life_garage_sp = [(_spawnPos modelToWorld [-11.5,0,0]),(getDir _spawnPos)-90];
life_garage_type = _type;
[(player getVariable ["vehicles",[]]),_type,player] remoteExec ["TON_fnc_getVehicles", 2, false];
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];
