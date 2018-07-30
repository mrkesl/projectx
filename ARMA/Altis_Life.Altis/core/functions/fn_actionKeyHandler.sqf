#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	modified by Larvell

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_status"];
_curTarget = cursorTarget;
//if(life_action_inUse || life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
//if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	} else {
		if(playerSide == civilian && player distance (getMarkerPos "wood_1") < 50) exitWith {{
			_str = [_x] call life_fnc_varToStr;
			_val = missionNameSpace getVariable _x;
			if(_val > 0 ) then{
			if( _str == "AXT" || _str == "axe" ) then{
			_handle = [] spawn life_fnc_axtUse;
			waitUntil {scriptDone _handle};};};} foreach life_inv_items;
			};
		if(playerSide == civilian && (player distance (getMarkerPos "lead_1") < 30) || (player distance (getMarkerPos "iron_1") < 30) || (player distance (getMarkerPos "salt_1") < 120) || (player distance (getMarkerPos "sand_1") < 75) || (player distance (getMarkerPos "diamond_1") < 50) || (player distance (getMarkerPos "oil_1") < 40) || (player distance (getMarkerPos "oil_2") < 40) || (player distance (getMarkerPos "rock_1") < 50)) exitWith {{
			_str = [_x] call life_fnc_varToStr;
			_val = missionNameSpace getVariable _x;
			if(_val > 0 ) then{
			if( _str == "Spitzhacke" || _str == "pickaxe" ) then{
			_handle = [] spawn life_fnc_pickAxeUse;
			waitUntil {scriptDone _handle};};};} foreach life_inv_items;
			};
		if(playerSide == civilian) exitWith {
			_handle = [] spawn life_fnc_gather;
			waitUntil {scriptDone _handle};
		};
	};
	//Hütchen Fix by Creedcoder
	if (count nearestObjects[getPos player,["RoadCone_L_F"],2] > 0) then {
		private["_handle"];
		_handle = [(nearestObjects[getPos player,["RoadCone_L_F"],2] select 0)] spawn life_fnc_pickupItem;
		waitUntil {scriptDone _handle};
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	if((typeOf _curTarget) == "Land_PortableLight_double_F") exitWith {
			//OK, it was a misc item
			private["_handle"];
			_handle = [_curTarget] spawn life_fnc_pickupItem;
			waitUntil {scriptDone _handle};
		};
		if !(isNil {_curTarget getVariable "status"})then{
    	_status = _curTarget getVariable "status";
    	diag_log format["DEBUG:--: Status des Cursortargets: %1 ",_status];
        if(life_onDuty OR playerSide == west)then{
            if( _status == "deployed" )then{
                deleteVehicle _curTarget;
                hint "Ziel müsste gelöscht sein.";
            };
        };
    }else{
		if(typeOf _curTarget in ["Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_Bench_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_Bench_01_F","Land_Bench_02_F"])then{
			hint " sie könnten sich hinsetzten";
		}else{
        	[_curTarget] call life_fnc_houseMenu;
        };
    };
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!

//Temp fail safe.
/*[] spawn {
	sleep 60;
	life_action_inUse = false;
};*/

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide == blufor && {(call life_revive_cops)}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if(playerSide == west)then{
		[_curTarget] call life_fnc_copInteractionMenu;
	}else{
		if(_curTarget getVariable "gefesselt") then{
			[_curTarget] call life_fnc_InteractionMenu;
		};
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F","RoadBarrier_F","Pole_F","TapeSign_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";

	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};
