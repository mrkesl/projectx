/*
	Author: Karel Moricky

	Description:
	Increase the respawn time based on a condition

	Parameter(s):
		0: CODE - Condition, must return BOOL
		1: NUMBER - delay in seconds which is applied when the condition is true
		2: STRING - description displayed when the delay is in effect

	Returns:
	NOTHING
*/
params [["_condition", {false}, [{false}]], ["_delayMax", 0, [0]], ["_description", "", [""]]];
private ["_delay","_return","_time"];
_delay = 0;

while {!alive player} do {
	call _condition params [["_return", false, [false]]];
	//_return = [call _condition,0,false,[false]] call bis_fnc_paramIn;
	if (call _condition) then {
		titletext [_description,"plain"];
		if (_delay == 0) then {
			_delay = _delayMax;
			setPlayerRespawnTime (playerrespawnTime + _delay);
		};
	} else {
		if (_delay != 0) then {
			setPlayerRespawnTime (playerrespawnTime - _delay);
			_delay = 0;
		};
	};

	_time = time + 1;
	waituntil {time > _time};
};

titletext ["","plain"];
setPlayerRespawnTime getnumber (missionconfigfile >> "respawnDelay")