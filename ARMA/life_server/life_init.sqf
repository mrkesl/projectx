_host = "localhost";
_port = 6380;
_password = "mandasisteinkackpw";
[_host, _port ,_password] call db_fnc_setup;
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
life_server_isReady = false;
publicVariable "life_server_isReady";
[] execVM "\life_server\functions.sqf";
diag_log "Funktions Loaded";

true spawn TON_fnc_vehicleReset; // Creedcoder Vehicle Reset für Redis
diag_log "Vehicle Reset";

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");
//[] execVM "\life_server\fn_initHC.sqf";
life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
serv_sv_use = [];
fed_bank setVariable["safe",(count playableUnits),true];
//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.
[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

[] spawn {
  while {true} do {
    sleep (30 * 60);
    {
      _x setVariable["sellers",[],true];
      nil;
    } count [Dealer_1,Dealer_2,Dealer_3];
  };
};
//Strip NPC's of weapons
{
  if(!isPlayer _x) then {
    _npc = _x;
    {
      if(_x != "") then {
        _npc removeWeapon _x;
      };
      nil;
    } count [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
  };
  nil;
} count allUnits;

//Group and AI Boost
true spawn {
  while {true} do {
    {
      if(count (units _x) == 0) then {
        deleteGroup _x;
      };
      nil;
    } count allGroups;
    sleep 1000;
  };
};

[] spawn TON_fnc_initHouses;
diag_log "House Init";
//Lockup the dome
private["_dome","_rsb"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];
for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;
life_server_isReady = true;
publicVariable "life_server_isReady";
diag_log "Server Ready!";

//Custom Content    Gold stuff  http://www.altisliferpg.com/topic/4686-howto-dynamic-gold-spawnshunting/
call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";
[] execVM "\life_server\Functions\RageWorld\gold\fn_spawnGold.sqf";
gold_safe setVariable["gold",round(random 50),true];
[] spawn TON_fnc_goldUpdate;
fnc_logout_player = { // Cleanup Script von Creedcoder um Körper von Disconnecteten Spielern zu löschen
    _player = _this;
    if(isNull _player) exitWith {};
    _loops = 0;
    while {true} do {
        if(_loops >= 25) exitWith {};
        if(!alive _player) exitWith {
            _containers = nearestObjects[_player,["WeaponHolderSimulated"],5];
            if(count _containers > 0) then {
                {deleteVehicle _x;} foreach _containers;
            };
            deleteVehicle _player;
        };
        _loops = _loops + 1;
        sleep 1;
    };
};
addMissionEventHandler ["HandleDisconnect",{
    (_this select 0) spawn fnc_logout_player;
}];
[] execVM "\life_server\Functions\airdrop\config.sqf";
[] execVM "\life_server\Functions\airdrop\fn_generateAirdropAuto.sqf";
[] execVM "\life_server\Functions\smarkt\fn_smarkt.sqf";
[] execVM "\life_server\Functions\Larvell\restart.sqf";
ist_notstand = false;
publicVariable "ist_notstand";
allow_notstand = false;
publicvariable "allow_notstand";
