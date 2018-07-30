/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops"];
_markers = [];
_cops = [];
sleep 0.25;
if(visibleMap) then {
	{
		if(side _x == west) then {
			_cops pushBack _x;
		};
		nil;
	} count allPlayers; //Fetch list of cops / blufor

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
		_markers pushBack [_marker,_x];
		nil;
	} count _cops;

	while {visibleMap} do	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then	{
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
	_cops = [];
};
