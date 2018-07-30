/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine //Ragdoll by Killzone_Kid port by Creedcoder
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
params [["_unit", ObjNull, [ObjNull]], ["_shooter", ObjNull, [ObjNull]]];
private["_curWep","_curMags","_attach"];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false; player setVariable["tazed",false,true];};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!life_istazed) then
	{
		player setVariable["tazed",true,true];
		life_istazed = true;
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems player} else {[]};

		private "_rag";
		_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
		_rag setMass 1e10;
		_rag attachTo [player, [0,0,0], "Spine3"];
		_rag setVelocity [0,0,6];
		player allowDamage false;
		detach _rag;
		[_unit] remoteExec ["life_fnc_tazeSound", 0, false];
		[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]] remoteExec ["life_fnc_broadcast", 0, false];
		0 = _rag spawn {
			deleteVehicle _this;
			player allowDamage true;
		};

		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		if(count _attach != 0 && primaryWeapon player != "") then {
			{
				player addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then {
			{player addMagazine _x;} foreach _curMags;
		};
		disableUserInput true;
		disableUserInput false;
		disableUserInput true;
		sleep 15;
		player setPosWorld getPosWorld player;
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["life_fnc_animSync", 0, false];

		life_istazed = false;
		player setVariable["tazed",false,true];
		player allowDamage true;
		disableUserInput false;
		player addWeapon _curWep;
	};
}
	else
{
	_unit allowDamage true;
	life_iztazed = false;
	player setVariable["tazed",false,true];
};