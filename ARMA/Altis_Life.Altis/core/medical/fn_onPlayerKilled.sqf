/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
params [["_unit", ObjNull, [ObjNull]], ["_killer", ObjNull, [ObjNull]]];
disableSerialization;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["gefesselt",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer","_revivebtn"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_revivebtn = ((findDisplay 7300) displayCtrl 7306);
	_revivebtn ctrlEnable false;
	ctrlshow [7306, false];
	if((player getVariable ["admin_level", 0]) > 1) then {
		_revivebtn ctrlEnable true;
		ctrlshow [7306, true];
		};

	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 || isNull _this || Life_request_timer};

	if (Life_request_timer) then {
		Life_request_timer = false; //resets increased respawn timer
		_maxTime = time + (life_respawn_timer * 450);
		waitUntil {_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0 || isNull _this};
		};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"] remoteExec ["life_fnc_wantedAdd", 2, false];
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[2] remoteExec ["life_fnc_removeLicenses", _killer, false];
		};
	} else {
		[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"] remoteExec ["life_fnc_wantedAdd", 2, false];

		if(!local _killer) then {
			[3] remoteExec ["life_fnc_removeLicenses", _killer, false];
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {(player getvariable["cash",0]) > 0}) then {
		[format[localize "STR_Cop_RobberDead",[(player getvariable["cash",0])] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", 0, false];
		player setvariable["cash", 0, true];
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

player setvariable["thirst", 100, true];
player setvariable["hunger", 100, true];
life_carryWeight = 0;
player setvariable["cash", 0, true];

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_sidechat,playerSide] remoteExec ["TON_fnc_managesc", 2, false];

true spawn REDIS_fnc_save;

deletevehicle _unit;
