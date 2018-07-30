/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder ;P
	Description:
	Inserts the gang into the database.
*/
params [
	["_unit", ObjNull, [ObjNull]],
	["_uid", "", [""]],
	["_gangName", "", [""]],
	["_dbname", "", [""]]
];
private["_group","_query"];

_group = group _unit;

//Check to see if the gang name already exists.
_count = "ArmaRedisClient" callExtension format["get·%1_count", _dbname];
if (_count == "true") exitWith {
	[1,"There is already a gang created with that name please pick another name."] remoteExec ["life_fnc_broadcast", _unit, false];
	["life_action_gangInUse",nil,missionNamespace] remoteExec ["life_fnc_netSetVar", _unit, false];
};

_group setVariable["gang_id",_dbname,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_maxMembers",8,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_members",[_uid],true];

_unit setVariable ["gang", _dbname, true];

[_group] remoteExec ["life_fnc_gangCreated", _unit, false];

_query = [];
_query pushback (_dbname);
_query pushback (_uid);
_query pushback (_gangName);
_query pushback (8);
_query pushback (0);
_query pushback ([_uid]);

[_dbname, str _query, 1] spawn db_fnc_save;
