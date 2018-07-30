params [["_script", "", ["",[]]]];

if (typename _script == typename []) then {
	params [["_params", [], [[]]], ["_script", "", ["",[]]]];
};

_params execvm _script