/*
Just a test
*/
params [["_fuelvalue", ObjNull, [ObjNull]]];

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

diag_log "------------- Test -------------";
diag_log format["Value: %1",_fuelvalue];
diag_log "------------- Test Ende -------------";

waitUntil {!DB_Async_Active};
_query = format["UPDATE vehicles SET fuel='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_fuelvalue];
_queryResult = [_query,1] call DB_fnc_asyncCall;
