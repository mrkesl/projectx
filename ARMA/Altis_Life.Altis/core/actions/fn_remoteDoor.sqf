 /*
	File: fn_remoteDoor.sqf
	Author: [WAF]Bricktop alias BLG edit by Creedcoder

	Description:
	Remote Doors open/and auto close 10s (unlock/lock).
	Check what kind of object is selected and animationstate of it. Then play sound (/et. unlock) - then animate it (/et. lock) - and (/et. animate again) , and end the sound.
*/

private["_tor","_type","_pos","_check"];

_tor = _this select 0;
_time = _this select 1;
_type = _this select 2;
_check = 0;

if(_tor getVariable ["doorInUse",false]) exitWith {};

switch (_type) do {
	case "Bar": {
		_tor setVariable["doorInUse",true,true];
		if((_tor animationPhase "Door_1_rot") == 1) then {
			hint"Schranke wird in 10 Sekunden geschlossen";
			sleep _time;
			_tor animate ["Door_1_rot", 0];
		} else {
			_tor animate ["Door_1_rot", 1];
			sleep _time;
			_tor animate ["Door_1_rot", 0];
		};
		_tor setVariable["doorInUse",false,true];
	};
	case "Gate": {
		_tor setVariable["doorInUse",true,true];
		_tor setVariable["bis_disabled_Door_1",0,true];
		_tor setVariable["bis_disabled_Door_2",0,true];
		if(((_tor animationPhase "Door_1_rot") == 1) && ((_tor animationPhase "Door_2_rot") == 1)) then {
			hint"Tor wird in 10 Sekunden geschlossen";
			sleep _time;
			_tor animate ["Door_1_rot", 0];
			_tor animate ["Door_2_rot", 0];
		} else {
			_tor setVariable["doorInUse",true,true];
			if(((_tor animationPhase "Door_1_rot") == 0) && ((_tor animationPhase "Door_2_rot") == 1)) exitWith {
				_check = 1;
				_tor animate ["Door_1_rot", 1];
				sleep _time;
				_tor animate ["Door_1_rot", 0];
				_tor animate ["Door_2_rot", 0];
				_tor setVariable["bis_disabled_Door_1",1,true];
				_tor setVariable["bis_disabled_Door_2",1,true];
				_tor setVariable["doorInUse",false,true];
			};
			if(((_tor animationPhase "Door_1_rot") == 1) && ((_tor animationPhase "Door_2_rot") == 0)) exitWith	{
				_check = 1;
				_tor animate ["Door_2_rot", 1];
				sleep _time;
				_tor animate ["Door_1_rot", 0];
				_tor animate ["Door_2_rot", 0];
				_tor setVariable["bis_disabled_Door_1",1,true];
				_tor setVariable["bis_disabled_Door_2",1,true];
				_tor setVariable["doorInUse",false,true];
			};
			_tor animate ["Door_1_rot", 1];
			_tor animate ["Door_2_rot", 1];
			sleep _time;
			_tor animate ["Door_1_rot", 0];
			_tor animate ["Door_2_rot", 0];
		};
		if(_check == 1) exitWith {};
		_tor setVariable["bis_disabled_Door_1",1,true];
		_tor setVariable["bis_disabled_Door_2",1,true];
		_tor setVariable["doorInUse",false,true];
	};
};