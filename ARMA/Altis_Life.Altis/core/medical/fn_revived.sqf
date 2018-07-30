/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
params [["_medic", "Unknown Medic", [""]]];
private "_dir";
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExec ["life_fnc_corpse", 0, false];
_dir = getDir life_corpse;

	hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];
	closeDialog 0;
	life_deathCamera cameraEffect ["TERMINATE","BACK"];
	camDestroy life_deathCamera;
//Take fee for services.
	if((player getvariable["bankacc",0]) > (call life_revive_fee)) then {
		player setvariable["bankacc", (player getvariable["bankacc",0]) - (call life_revive_fee), true];
	} else {
		player setvariable["bankacc", 0, true];
	};

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {[player,0,"textures\Medic\kleidung.paa"] remoteExec ["life_fnc_setTexture", 0, false];};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[life_corpse] remoteExec ["life_fnc_corpse", 0, false];
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate; //Request update of hud.

[] execVM "Rageworld\monitorupdate.sqf";
