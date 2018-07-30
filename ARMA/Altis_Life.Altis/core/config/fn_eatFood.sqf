/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
params [["_food", "", [""]]];
private["_val","_sum"];
if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 10};
		case "rabbit":{ _val = 20};
		case "salema": {_val = 30};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 100};
		case "mullet": {_val = 80};
		case "catshark": {_val = 100};
		case "turtle": {_val = 100};
		case "turtlesoup": {_val = 100};
		case "donuts": {_val = 30};
		case "tbacon": {_val = 40};
		case "peach": {_val = 10};
	};

	_sum = (player getvariable["hunger", 100]) + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "You have over eaten, you are now feeling fatigued.";};
	player setvariable["hunger",_sum, true];
};
