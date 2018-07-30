/*
File: fn_generate_number.sqf
Author: Larvell (code for number creation by Creedcoder)
Date: 13.08.2015 rework for redis 05.10.2015

Description:
- add unique phonenumbers to db

*/
params [
  ["_sender", objNull,[objNull]]
];
private ["_uid", "_nummer", "_rnd", "_civnummer", "_copnummer", "_mednummer","_oldnumber"];

_uid = getPlayerUID _sender;
_nummer = (getPlayerUID _sender) select [10, 16];
_rnd = {str(round (100+(random 899)))};
_civnummer = "0815" + call _rnd + _nummer;
_copnummer = "0110" + call _rnd + _nummer;
_mednummer = "0112" + call _rnd + _nummer;
_oldnumber = _sender getVariable["mynumber",0];

switch (side _sender) do
{
        case civilian:
                {
                _sender setVariable ["mynumber", _civnummer, true];
                };
        case west:
                {
                _sender setVariable ["mynumber", _copnummer, true];
                };
        case independent:
                {
                _sender setVariable ["mynumber", _mednummer, true];
                };

};
_sender setVariable ["mymsgs", [], true];
