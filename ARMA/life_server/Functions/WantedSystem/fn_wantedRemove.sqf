/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Removes a person from the wanted list.
*/
params [["_uid", "", [""]]];
private["_query"];
if(_uid == "") exitWith {}; //Bad data

 [_uid, 4] call db_fnc_listdel;
