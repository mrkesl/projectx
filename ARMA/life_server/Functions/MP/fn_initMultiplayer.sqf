/*
	Author: Karel Moricky

	Description:
	Multiplayer mission init, executed automatically upon mission start.

	Parameter(s):
	None

	Returns:
	NOTHING
*/

//--- Execute MP functions
if (isMultiplayer) then {
	["BIS_fnc_initMultiplayer"] call bis_fnc_startLoadingScreen;
	BIS_fnc_MP_packet = [];
	"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call BIS_fnc_MPexec};

	//--- Execute persistent functions
	waituntil {!isnil "bis_functions_mainscope"};
	_queue = bis_functions_mainscope getvariable ["BIS_fnc_MP_queue",[]];
	{
		//--- Do not declare persistent call again to avoid infinite loop
		_varValue = +_x;
		_varValue params [
		["_mode", 0, [0]],
		["_params", [], [[]]],
		["_functionName", "", [""]],
		["_target", -1, [objnull,true,0,[],sideUnknown,grpnull]],
		["_isPersistent", false, [false]],
		["_isCall", false, [false]]
		];

		switch (typename _target) do {
			case (typename objnull): {
				if (local _target) then {
					["BIS_fnc_MP_packet",[_mode,_params,_functionName,_target,false,_isCall]] call BIS_fnc_MPexec; //--- Local execution
				};
			};
			case (typename true): {
				if (_target) then {
					["BIS_fnc_MP_packet",[_mode,_params,_functionName,_target,false,_isCall]] call BIS_fnc_MPexec; //--- Local execution
				} else {
					[_params,_functionName,_target,false,_isCall] call BIS_fnc_MP; //--- Global execution
				};
			};
			case (typename grpnull);
			case (typename sideUnknown): {
				["BIS_fnc_MP_packet",[_mode,_params,_functionName,_target,false,_isCall]] call BIS_fnc_MPexec; //--- Local execution
			};
			case (typename 0): {
				//--- Disabled
			};
		};
	} foreach _queue;
	["BIS_fnc_initMultiplayer"] call bis_fnc_endLoadingScreen;
};