//execute code as server by Larvell
params [
["_condition",0,[0]],
["_unit",ObjNull,[ObjNull, ""]],
["_classname","",[""]],
["_position", [0,0,999], [[]]],
["_uid", "1337",[""]]
];
private["_vehicle"];
diag_log "## global variables and actions ##";
diag_log format["_condition=%1 _unit=%2 _classname=%3 _position=%4 _uid=%5",_condition,_unit,_classname,_position,_uid];
switch (_condition) do {
	case 1: {
			_vehicle = createVehicle [_className, _position,[], 0, "CAN_COLLIDE"];
			_vehicle allowDamage false;
			[_vehicle] remoteExecCall ["life_fnc_set_global",_unit];
			[_vehicle] call life_fnc_clearVehicleAmmo;
			_vehicle spawn {
				uisleep 5;
				_this allowDamage true;
			};
		};
	case 2: {
			_vehicle = objectFromNetId _unit;
			_container = createVehicle[_classname, _position, [], 0, "CAN_COLLIDE"];
			switch (typeof _vehicle) do {
				case "C_Van_01_transport_F":	{_container attachTo [_vehicle,[0,-1.1,0]];};
				case "C_Offroad_01_F":			{_container attachTo [_vehicle,[0,-1,0]];};
				case "I_Truck_02_transport_F":	{_container attachTo [_vehicle,[0.02,0.4,0]];};
				case "O_Truck_03_transport_F":	{_container attachTo [_vehicle,[0.06,-0.7,0]];};
			};
			_vehicle setVariable["box", true, true];
			_container setVariable ["Trunk",nil, true];
			clearWeaponCargoGlobal _container;
			clearMagazineCargoGlobal _container;
			clearItemCargoGlobal _container;
			_vehicle addMPEventHandler ["mpKilled",{{deleteVehicle _x; diag_log format["delete box _x=%1",_x];} foreach (attachedObjects (_this select 0));}];
			[_vehicle, _classname] spawn TON_fnc_upgrade;
		};
	default {diag_log format["fn_global.sqf condition (%1) not found", _condition];};
};
