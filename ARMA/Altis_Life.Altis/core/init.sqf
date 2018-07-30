#include <macro.h>
/*
        Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready

enableRadio false;
enableSentences false;
player disableConversation true;

//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};

//Init Part 2 Creedcoder Redis Lade System
life_client_init = {
  0 cutText["Finishing client setup procedure","BLACK FADED"];
  0 cutFadeOut 9999999;
  //diag_log "::Life Client:: Group Base Execution";
  [] spawn life_fnc_escInterupt;
  switch (playerSide) do
  {
          case west:
          {
                  _handle = [] spawn life_fnc_initCop;
                  waitUntil {scriptDone _handle};
          };

          case civilian:
          {
                  //Initialize Civilian Settings
                  _handle = [] spawn life_fnc_initCiv;
                  waitUntil {scriptDone _handle};
          };

          case independent:
          {
                  //Initialize Medics and blah
                  _handle = [] spawn life_fnc_initMedic;
                  waitUntil {scriptDone _handle};
          };
  };
  // Set some hardware player variables. Variables..
  player setVariable["restrained",false,true];
  player setVariable["Escorting",false,true];
  player setVariable["transporting",false,true];
  player setVariable["gefesselt",false,true];
  player setVariable["transport",false,true];
  player setVariable["tazed",false,true];
  player setVariable["imFahrzeug",false,true];
  player setVariable["tazed",false,true];
  player setVariable ["surrender", false, true];
  diag_log "Past Settings Init";
  waitUntil {!(isNull (findDisplay 46))};
  diag_log "Display 46 Found";
  (findDisplay 46) displayAddEventHandler ["KeyUp", "_this call life_fnc_keyHandler"];
  (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandlerddown"];
  player addRating 99999999;
  diag_log "------------------------------------------------------------------------------------------------------";
  diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - timeStamp];
  diag_log "------------------------------------------------------------------------------------------------------";
  timeStamp = nil;
  life_sidechat = true;
  [player,life_sidechat,playerSide] remoteExec ["TON_fnc_managesc", 2, false];
  0 cutText ["","BLACK IN"];
  [] call life_fnc_hudSetup;
  LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
  LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
  [] call life_fnc_settingsInit;
  player setVariable["steam64ID",getPlayerUID player];
  player setVariable["realname",profileName,true];
  life_fnc_moveIn = compileFinal
  "
          player moveInCargo (_this select 0);
  ";
  life_fnc_garageRefund = compileFinal
  "
          _price = _this select 0;
          _unit = _this select 1;
          if(_unit != player) exitWith {};
          player setvariable[""bankacc"", (player getvariable[""bankacc"",0]) + _price, true];
  ";
  [] execVM "core\init_survival.sqf";
  [] execVM "core\welcome.sqf";
  player enableFatigue (call life_enableFatigue);


  // Permawanted
  //[getPlayerUID player,player getVariable["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate", 2, false]; //Creedcoder Wanted
  // Init automatically saving gear
  // the fuQ, bitte erklärt mir warum in der autosave 99% das selbe steht?  Warum zum fick ist das hier also doppelt?
  [] spawn life_fnc_autoSave;
};
[format["%1_%2",getPlayerUID player, str playerSide], player, "REDIS_fnc_load", false, 0] remoteExec ["db_fnc_load", 2, false];
