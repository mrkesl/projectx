params [["_van", ObjNull, [ObjNull]]];
private["_container", "_uid", "_classname"];
_uid = getPlayerUID player;

if(isNull _van) exitWith {};
_set = _van getVariable["box",false];

if(!_set) then {

switch(typeof _van)do{
	case "C_Van_01_transport_F":	{
			_price = 20000;
			if((player getvariable["bankacc",0]) < _price) exitWith {hint"Du hast nicht genug Geld auf deinem Konto!"};
			[2, netId _van, "CargoNet_01_box_F",[0,0,999],_uid] remoteExecCall ["LAR_fnc_global",2];
			player setvariable["bankacc", (player getvariable["bankacc",0]) - _price, true];
		};
	case "C_Offroad_01_F":			{
			_price = 15000;
			if((player getvariable["bankacc",0]) < _price) exitWith {hint"Du hast nicht genug Geld auf deinem Konto!"};
			[2, netId _van, "B_supplyCrate_F",[0,0,999],_uid] remoteExecCall ["LAR_fnc_global",2];
			player setvariable["bankacc", (player getvariable["bankacc",0]) - _price, true];
		};
	case "I_Truck_02_transport_F":	{
			_price = 25000;
			if((player getvariable["bankacc",0]) < _price) exitWith {hint"Du hast nicht genug Geld auf deinem Konto!"};
			[2, netId _van, "Box_IND_AmmoVeh_F",[0,0,999],_uid] remoteExecCall ["LAR_fnc_global",2];
			player setvariable["bankacc", (player getvariable["bankacc",0]) - _price, true];
		};
	case "O_Truck_03_transport_F":	{
			_price = 30000;
			if((player getvariable["bankacc",0]) < _price) exitWith {hint"Du hast nicht genug Geld auf deinem Konto!"};
			[2, netId _van, "Box_IND_AmmoVeh_F",[0,0,999],_uid] remoteExecCall ["LAR_fnc_global",2];
			player setvariable["bankacc", (player getvariable["bankacc",0]) - _price, true];
		};
};
} else{
	hint "Dein Fahrzeug besitzt dieses Upgrade bereits!";
};
