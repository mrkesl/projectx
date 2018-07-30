/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Keeps track of an array locally on the server of a players keys.
*/
params [["_uid", "", [""]], ["_side", sideUnknown, [sideUnknown]], ["_tmp"], ["_mode", 0, [0]]];
private "_arr";

if(_uid == "" OR _side == sideUnknown) exitWith {}; //BAAAAAAAAADDDDDDDD

switch(_mode) do {
	case 0: {
		params [["_input", [], [[]]]];
		_arr = [];
		{
			if(!isNull _x && {!(_x isKindOf "House")}) then {
				_arr pushBack _x;
			};
		} foreach _input;
		
		_arr = _arr - [ObjNull];
		missionNamespace setVariable[format["%1_KEYS_%2",_uid,_side],_arr];
	};
	
	case 1: {
		params [["_input", ObjNull, [ObjNull]]];
		if(isNull _input OR _input isKindOf "House") exitWith {};
		_arr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
		_arr pushBack _input;
		_arr = _arr - [ObjNull];
		missionNamespace setVariable[format["%1_KEYS_%2",_uid,_side],_arr];
	};
	
	case 2: {
		_arr = missionNamespace getVariable[format["%1_KEYS_%2",_uid,_side],[]];
		_arr = _arr - [ObjNull];
		missionNamespace setVariable[format["%1_KEYS_%2",_uid,_side],_arr];
	};
};