if (isNil "lar_has_god") then
{
	lar_has_god = 0;
};

if (lar_has_god == 0) then
{
	lar_has_god = 1;
    hint "GodMode Eingeschaltet ... du bist ein ganz großer";
	player setUnitRecoilCoefficient 0;
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	["Admin_Menu.log", format["%1 hat Godmode eingeschaltet", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
	//player addEventHandler ["Fired", { (_this select 0) setVehicleAmmo 1 }]
}

else
{
	lar_has_god = 0;
    hint "GodMode Ausgeschaltet. Bist du erwachsen geworden?";
	player allowDamage true;
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {this call life_fnc_handleDamage;}];
	player addEventHandler["Fired",{this call life_fnc_onFired}];
	player setUnitRecoilCoefficient 1;
	["Admin_Menu.log", format["%1 hat Godmode ausgeschaltet!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
};
[] call life_fnc_hudUpdate;
