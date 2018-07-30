/*
File: fn_teamMarkers.sqf
Author: Bryan "Tonic" by Daniel Larusso & LordNaikon (Keep Calm and RolePlay)
Description:
Marks medics on the map for other medics when it's open.
*/
private["_markers","_medic"];
_markers = [];
_medic = [];
sleep 0.25;
if(visibleMap) then {
  {
    if(side _x == independent) then {
      _medic pushBack _x;
    };
    nil;
  } count allPlayers; //Fetch list of Medics
  //Create markers
  {
    _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "Mil_dot";
    _marker setMarkerTextLocal format["%1",name _x];
    _markers pushBack [_marker,_x];
    nil;
  } count _medic;
  while {visibleMap} do {
    {
      private["_marker","_unit"];
      _marker = _x select 0;
      _unit = _x select 1;
      if(!isNil "_unit") then {
        if(!isNull _unit) then {
        _marker setMarkerPosLocal (visiblePosition _unit);
        };
      };
      nil;
    } count _markers;
    if(!visibleMap) exitWith {};
    sleep 0.02;
  };
  {
    deleteMarkerLocal (_x select 0);
    nil;
  } count _markers;
  _markers = [];
  _medic = [];
};
