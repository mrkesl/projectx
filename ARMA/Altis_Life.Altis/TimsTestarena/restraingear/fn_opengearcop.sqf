/*
Show gear from target
*/
params [["_unit", ObjNull, [ObjNull]]];

if(_unit getVariable["restrained",FALSE]) then{
player action ["gear", _unit];
}
else{
hint format["Du musst jemanden Handschellen anlegen um ihn zu durchsuchen!"];
};