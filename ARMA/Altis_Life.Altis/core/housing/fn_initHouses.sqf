/*
	Author: Bryan "Tonic" Boardwine
	Edit: Creedcoder
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(count (player getvariable["houses",[]]) == 0) exitWith {}; //Nothing to do.

{
	_house = objectFromNetId _x;
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	_marker = createMarkerLocal [format["house_%1", _x],getPosATL _house];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";

} foreach (player getvariable["houses",[]]);
