params [
  ["_vehicle",ObjNull,[ObjNull]],
  ["_classname","",[""]]
];
private["_key", "_db"];
_key = _vehicle getVariable["plate",""];
if(_key == "") exitWith {};
_db = 3; //Vehicle
[_key, 6, _classname, _db] spawn db_fnc_listset; //Container classname
