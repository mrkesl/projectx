if (isNil "lar_veh_god") then
{
	lar_veh_god = 0;
};

if (lar_veh_god == 0) then
{
	lar_veh_god = 1;
	cutText ["Cargod enabled","PLAIN DOWN"];
	["Admin_Menu.log", format["%1 hat Car Godmode eingeschaltet!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
	while {alive ( vehicle player ) && lar_veh_god == 1} do
		{
			vehicle player setfuel 1;
			vehicle player setvehicleammo 1;
			vehicle player setdammage 0;
			sleep 0.001;
		};
}
else
{
	lar_veh_god = 0;
	cutText ["Cargod disabled","PLAIN DOWN"];
	["Admin_Menu.log", format["%1 hat Car Godmode ausgeschaltet!", profileName]] remoteExec ["life_fnc_admin_log", 2, false];
	sleep 0.001;
};
[] call life_fnc_hudUpdate;
