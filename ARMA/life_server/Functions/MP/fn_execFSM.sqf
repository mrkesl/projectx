params [["_fsm", "", ["",[]]]];

if (typename _fsm == typename []) then {
	params [["_params", [], [[]]], ["_fsm", "", ["",[]]]];
};

_params execfsm _fsm