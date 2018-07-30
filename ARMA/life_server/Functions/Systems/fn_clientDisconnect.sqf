/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
private["_unit","_id","_uid","_name"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;

if(side _unit == civilian) then {[_uid,1] spawn life_fnc_wantedRemove;}; //  http://www.altisliferpg.com/topic/7275-release-persistent-wanted-system-done-the-right-way/

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;
deleteVehicle _unit;

[(_unit getvariable["houses",[]])] spawn TON_fnc_houseCleanup;
