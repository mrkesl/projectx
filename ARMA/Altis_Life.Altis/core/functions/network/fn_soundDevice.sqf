/*
	Description:
	Plays a device sound for mining (Mainly Tempest device).
*/
params [["_vehicle", Objnull, [Objnull]]];
if(isNull _vehicle) exitWith {};
if(player distance _vehicle > 2500) exitWith {}; //Don't run it... They're to far out..

while {true} do {
	if(player distance _vehicle < 2500) then
	{
		if((isNull _vehicle) OR (!alive _vehicle) OR (isNil {_vehicle getVariable "mining"})) exitWith {};
		_vehicle say3D "Device_disassembled_loop";
	};
	sleep 28.6;
};
