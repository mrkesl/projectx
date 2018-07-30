/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a
	stored procedure on restart.
*/
#define fnfind(__var1,__var2) (__var1 find __var2)
#define arraydel(__array,__item) __array deleteAt fnfind(__array,__item);
params[
	["_netid","",[""]]
	];
private ["_houses"];
if(_netid == "") exitWith {};
[_netid, 2] spawn db_fnc_delete;

_houses = ["Index", 2] call db_fnc_load;
arraydel(_houses,_netid)
["Index", str _houses, 2] spawn db_fnc_save;
