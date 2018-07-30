/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = TRUE;
player setvariable["thirst", 100, true];
player setvariable["hunger", 100, true];
life_carryWeight = 0;
player setvariable["cash", 0, true]; //Make sure we don't get our cash back.
life_respawned = false;
life_drink = 0;
life_onDuty = false;
life_isSuicide = false;
life_pendent = false ;    // stuff
life_isNOT_pending = false; // stuff
life_knockout = false;
life_istazed = false;

player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(player getVariable ["arrested", false]) exitWith {
	hint localize "STR_Jail_Suicide";
	player setVariable ["arrested", false, true];
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[getPlayerUID player,player,life_copRecieve,true] remoteExec ["life_fnc_wantedBounty", 2, false]; // NEW  PErmawanted
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[getPlayerUID player] remoteExec ["life_fnc_wantedRemove", 2, false];
};

true spawn REDIS_fnc_save;
[] call life_fnc_hudUpdate; //Request update of hud.



