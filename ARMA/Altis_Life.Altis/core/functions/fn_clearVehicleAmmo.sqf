/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Clears the vehicle of ammo types that we don't want.

	Edit Larvell: Fahrzeuge behalten im Notstand ihre Munition
*/
params [["_vehicle", Objnull, [ObjNull]]];
private["_veh"];
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;
diag_log format["CLEAR VEHICLE: _vehicle=%1, _veh=%2", _vehicle, _veh];
if(ist_notstand) exitWith
	{
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		if(_veh == "O_APC_Wheeled_02_rcws_F") exitWith {_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];}; //GMG einfach zu krass!
	};

switch (_veh) do {
    case "B_Boat_Armed_01_minigun_F": {
			_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
		};
		case "B_APC_Wheeled_01_cannon_F": {
			_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
			_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
		};
		case "O_Heli_Attack_02_black_F": {
			_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
			_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells",[0]];
			_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
			_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
		};
		case "B_Heli_Transport_01_F": {
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
		};
		case "B_MRAP_01_hmg_F": {
			_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Red",[0]];
		};
		case "O_APC_Wheeled_02_rcws_F": {
			_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
			_vehicle removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
		};
};
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
