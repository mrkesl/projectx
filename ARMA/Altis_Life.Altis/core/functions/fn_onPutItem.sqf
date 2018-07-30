/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Syncs changes to containers in houses?
*/
params [["_unit", ObjNull, [ObjNull]], ["_container", ObjNull, [ObjNull]], ["_item", "", [""]]];
if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?