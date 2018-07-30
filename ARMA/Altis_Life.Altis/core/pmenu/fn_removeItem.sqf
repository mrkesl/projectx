/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du hast nichts zum entfernen ausgewählt.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Du hast keine korrekte Anzahl angegeben."};
if(parseNumber(_value) <= 0) exitWith {hint "Du musst eine Anzahl von dem was du abgeben willst angeben."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Das ist ein illegales Item und Gardisten sind in der Nähe. Du kannst Beweise in ihrem Beisein nicht entsorgen.","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst keine Items entfernen während du in einem Fahrzeug sitzt.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Die angegebene Anzahl an Items kann nicht entfernt werden, besitzt du vielleicht nicht genug?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast erfolgreich %1 %2 Items aus deinem Inventar entfernt.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;