/*
	File: fn_pickupItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for picking up an item.
*/
params [["_obj", objNull, [objNull]]];
private["_itemInfo","_itemName","_illegal","_diff","_pickables","_pickable"];
if((time - life_action_delay) < 2) exitWith {hint "You can't rapidly use action keys!"};
if(isNull _obj OR isPlayer _obj) exitWith {};
_pickables = ["RoadCone_L_F","RoadBarrier_F","Pole_F","TapeSign_F","Land_PortableLight_double_F"];
_pickable = typeof _obj;
if((playerSide != west) && !life_onDuty && (_pickable in _pickables)) exitWith {hint "Finger weg!";};
if(((playerSide == west) OR (life_onDuty)) && (_pickable in _pickables)) exitWith {
if(_pickable == "RoadCone_L_F") then {[true,"huetchen",1] call life_fnc_handleInv;};
if(_pickable == "RoadBarrier_F") then {[true,"absperrung",1] call life_fnc_handleInv;};
if(_pickable == "Pole_F") then {[true,"pole",1] call life_fnc_handleInv;};
if(_pickable == "TapeSign_F") then {[true,"tapesign",1] call life_fnc_handleInv;};
if(_pickable == "Land_PortableLight_double_F") then {[true,"strahler",1] call life_fnc_handleInv;};
deleteVehicle _obj;
};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
if(player distance _obj > 3) exitWith {};
_itemInfo = _obj getVariable "item";
_itemName = [([_itemInfo select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_illegal = [_itemInfo select 0,life_illegal_items] call TON_fnc_index;
if(playerSide == west && _illegal != -1) exitWith
{
	titleText[format[localize "STR_NOTF_PickedEvidence",_itemName,[(life_illegal_items select _illegal) select 1] call life_fnc_numberText],"PLAIN"];
	player setvariable["bankacc", (player getvariable["bankacc",0]) + ((life_illegal_items select _illegal) select 1), true];
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	life_action_delay = time;
};
life_action_delay = time;
_diff = [_itemInfo select 0,_itemInfo select 1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"};
_obj setVariable["PickedUp",TRUE,TRUE];
if(_diff != _itemInfo select 1) then
{
	if(([true,_itemInfo select 0,_diff] call life_fnc_handleInv)) then
	{
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		_obj setVariable["item",[_itemInfo select 0,((_itemInfo select 1) - _diff)],true];
		_obj setVariable["PickedUp",false,true];
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	};
}
	else
{
	if(([true,_itemInfo select 0,_itemInfo select 1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		//waitUntil{isNull _obj};
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 0.5;
		titleText[format[localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
	};
};
