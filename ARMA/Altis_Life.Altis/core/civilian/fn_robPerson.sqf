/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
params [["_robber", ObjNull, [ObjNull]]];
if(isNull _robber) exitWith {}; //No one to return it to?

if((player getvariable["cash",0]) > 0) then
{
	[(player getvariable["cash",0])] remoteExec ["life_fnc_robReceive", _robber, false];
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"] remoteExec ["life_fnc_wantedAdd", 2, false];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[(player getvariable["cash",0])] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", 0, false];
	player setvariable["cash", 0, true];
}
	else
{
	[2,"STR_NOTF_RobFail",true,[profileName]] remoteExec ["life_fnc_broadcast", _robber, false];
};
[] spawn REDIS_fnc_save;
