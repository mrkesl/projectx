/*
 File: fn_keyHandler.sqf
 Author: Bryan "Tonic" Boardwine
 modified by Libra / Libra: Larvell

 Description:
 Main key handler for event 'keyUp'
*/

#include <macro.h>

private ["_x_car","_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_keyLeanLeft","_keyLeanRight","_keyActionContext","_interruptionKeys","_curTarget","_actor"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_actor = player;
_curTarget = cursorTarget;
_speed = speed cursorTarget;
_handled = false;
_veh = vehicle player;
_x_car = _veh getVariable "x_car";
_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
//_keyLeanLeft = actionKeys "LeanLeft" select 0;
//_keyLeanRight = actionKeys "LeanRight" select 0;
//_keyActionContext = actionKeys "ActionContext" select 0;
//hint str _code;
//_interruptionKeys = [17,30,31,32]; //A,S,W,D
//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
 true;
};
/*
if(life_action_inUse) exitWith {
 if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
 _handled;
};
*/
//_blinkerLinks = if(count (actionKeys "User2") == 0) then {16} else {(actionKeys "User2") select 0};
//shift Q oder UserAction 2
//_blinkerRechts = if(count (actionKeys "User1") == 0) then {18} else {(actionKeys "User1") select 0};
//shift E oder Useraction 1
_blinkerWarn = if(count (actionKeys "User3") == 0) then {15} else {(actionKeys "User3") select 0};
// Tab oder Useraction 3
//Hotfix for Interaction key not being able to be bound on some operation systems.
/*if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
 //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
 if((!life_action_inUse) && (!life_action_gathering) && (vehicle player == player) && (!(player getVariable "surrender")) && !_shift && !_alt && !_ctrlKey && !_keyLeanLeft && !_keyLeanRight) then {
 [] spawn
  {
   private["_handle"];
   _handle = [] spawn life_fnc_actionKeyHandler;
   waitUntil {scriptDone _handle};
   life_action_inUse = false;
   life_action_gathering = false;
  };
 };
 true;
};*/
if !(life_key_handle) then {
life_key_handle = true;
switch (_code) do{
 //Space key for Jumping
 case 57:{
  if(life_action_inUse || life_action_gathering) exitWith {false;};
  if(isNil "jumpActionTime") then {jumpActionTime = 0;};
  if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!(player getVariable ["arrested", false])} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
   jumpActionTime = time; //Update the time.
   [player,true] spawn life_fnc_jumpFnc; //Local execution
	[player,false] remoteExec ["life_fnc_jumpFnc", 0, false];   //Global execution
  };
 };
 //Holster / recall weapon.
 case 35:{
  if(_shift && !_ctrlKey && currentWeapon player != "") then {
   life_curWep_h = currentWeapon player;
   player action ["SwitchWeapon", player, player, 100];
   player switchcamera cameraView;
  };
  if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
   if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
    player selectWeapon life_curWep_h;
   };
  };
  _handled = true;
 };
 //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
 case _interactionKey:{
  if((!life_action_inUse) && (!life_action_gathering) && (vehicle player == player) && (!(player getVariable "surrender")) && !_shift && !_alt && !_ctrlKey) then {
    _handled = true;
    life_action_inUse = true;
	  life_action_gathering = true;
    [] spawn{
    private["_handle"];
    _handle = [] spawn life_fnc_actionKeyHandler;
    waitUntil {scriptDone _handle};
    life_action_inUse = false;
	life_action_gathering = false;
   };
  };
  true;
 };
 //Restraining (Shift + R)
 case 19:{
            if(_shift) then {_handled = true;};
            if(_shift)then{
                if(playerSide == west)then{
                    if(!isNull _curTarget && _curTarget isKindOf "Man")then{
                        if((isPlayer _curTarget) && (side _curTarget in [civilian,independent]))then{
                            if(alive _curTarget && _curTarget distance player < 2.0)then{
                                if(!(_curTarget getVariable "Escorting") && !(_curTarget getVariable "restrained")&& !(_curTarget getVariable "gefesselt"))then{
                                    if(speed _curTarget < 1) then{
                                        [] call life_fnc_restrainAction;
										[_curTarget,"handschellen"] remoteExec ["life_fnc_soundPlay", 0, false];
                                    };
                                };
                            };
                        };
                    };
                }else{
                    if(life_inv_kabelbinder > 0)then{
                        if(!isNull _curTarget && _curTarget isKindOf "Man")then{
                            if(isPlayer _curTarget)then{
                                if(alive _curTarget && _curTarget distance player < 2.0)then{
                                    if(!(_curTarget getVariable "Escorting")&& !(_curTarget getVariable "gefesselt") && !(_curTarget getVariable "transport")&& !(cursorTarget getVariable "restrained"))then{
                                        if(speed _curTarget < 2.5) then{
										   if((_curTarget getVariable "surrender") OR (_curTarget getVariable ["knockedout", false])  OR (_curTarget getVariable "tazed"))then{
											//hint " zip zip zipe die zipe zip zip ,Kabelbinder sind so fein";   //debug hint.
											[] call life_fnc_kabelbinderAction;
												[_curTarget,"kabelsound"] remoteExec ["life_fnc_soundPlay", 0, false];
										   };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
 };
//Knock out, this is experimental and yeah...
case 34:
{
  if(life_knockedout) exitWith { hint "Du wurdest KO geschlagen!"};
  if(_shift) then {_handled = true;};
  if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
  {
   if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
   {
    [cursorTarget] spawn life_fnc_knockoutAction;
    if("ItemRadio" in assignedItems cursorTarget) then {
      cursorTarget removeweapon "ItemRadio";
      hint "Das Handy der geschlagenen Person wurde fallen gelassen!";
      _defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);}
     else { hint "Diese Person hat kein Handy!"};
   };
  };
};
 //T Key (Trunk)
 case 20:{
  _isType = typeOf _curTarget;
  if(!_alt && !_ctrlKey) then{
   if(vehicle player != player && alive vehicle player) then{
    if((vehicle player) in life_vehicles) then{
     [vehicle player] call life_fnc_openInventory;
    };
   }else{
    if((_curTarget isKindOf "Car" OR _curTarget isKindOf "Air" OR _curTarget isKindOf "Ship" OR _curTarget isKindOf "House_F") && player distance _curTarget < 7 && vehicle player == player && alive _curTarget) then
    {
     if(_curTarget in life_vehicles OR {!(_curTarget getVariable ["locked",true])}) then
     {
      [_curTarget] call life_fnc_openInventory;
     };
    } else {
			if ((_isType isEqualTo "CargoNet_01_box_F") && (vehicle player == player) && (isnull attachedto _curTarget)) Then { [_curTarget] call life_fnc_openInventory;};
      if (_isType isEqualTo "B_supplyCrate_F") exitWith {_handled = true;};
      if (_isType isEqualTo "Box_IND_AmmoVeh_F") exitWith {_handled = true;};
			//if ((_isType isEqualTo "B_supplyCrate_F") && (vehicle player == player) && (isnull attachedto _curTarget)) Then { [_curTarget] call life_fnc_openInventory;};
			//if ((_isType isEqualTo "Box_IND_AmmoVeh_F") && (vehicle player == player) && (isnull attachedto _curTarget)) Then { [_curTarget] call life_fnc_openInventory;};
			};
   };
  };
  _handled = true;
 };
 //L Key?
 case 38:{
  if (_shift) then {
    if(!isNil{_veh getVariable["xcar",""]})then{
       if(_veh != player)then{
          if((driver _veh) == player) then{
            [_veh] call life_fnc_EinsatzLicht;
          };
        };
        _handled = true;
    };
  }else {
    if(playerSide == west)then{
      if(_veh == player)then{
        if(!_alt && !_ctrlKey) then {
           [] call life_fnc_radar;
        };
      };
    };
  };
};
 //Y Player Menu
 case 21:{
  if(!_alt && !_ctrlKey && !dialog) then{
   [] call life_fnc_p_openMenu;
  };
  _handled = true;
 };
 //F Key
 case 33:{
  if(!isNil{_veh getVariable "xcar"})then{
   if(_veh != player && ((driver _veh) == player)) then{
    _type = _veh getVariable ["xcar",""];
    if(_type in ["cop_car","Ucop_car"])then{
      if(_ctrlKey && _shift && _alt && (player getvariable["cop_level",0] > 0))exitWith{
       titleText ["Woop Woop!","PLAIN"];
       [_veh] remoteExec ["life_fnc_eeg1", -2, false];
      };
     if(_shift)exitWith{
      if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false];};
      if(_veh getVariable "siren2") then{
       titleText ["Yelp Aus","PLAIN"];
       _veh setVariable["siren2",false];
       [_veh,0] remoteExec ["life_fnc_copSiren2", -2, false];
      }else{
        titleText ["Yelp An","PLAIN"];
        _veh setVariable["siren2",true];
        [_veh,1] remoteExec ["life_fnc_copSiren2", -2, false];
      };
     };
     if(_ctrlKey)exitWith{
      titleText ["Durchsage","PLAIN"];
      [_veh] remoteExec ["life_fnc_copSiren", -2, false];
     };
     if(!_shift && !_ctrlKey && !_alt)exitWith{
      if(isNil {_veh getVariable "siren1"}) then {_veh setVariable["siren1",false];};
      if(_veh getVariable "siren1") then{
       titleText [localize "STR_MISC_SirensOFF","PLAIN"];
       _veh setVariable["siren1",false];
       [_veh,0] remoteExec ["life_fnc_copSiren1", -2, false];
      }else{
        titleText [localize "STR_MISC_SirensON","PLAIN"];
        _veh setVariable["siren1",true];
        [_veh,1] remoteExec ["life_fnc_copSiren1", -2, false];
      };
     };
    };
    if(_type in ["med_car"])exitWith{
     if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false];};
     if((_veh getVariable "siren")) then{
      titleText [localize "STR_MISC_SirensOFF","PLAIN"];
      _veh setVariable["siren",false];
      [_veh,0] remoteExec ["life_fnc_medicSiren", -2, false];
     }else{
      titleText [localize "STR_MISC_SirensON","PLAIN"];
      _veh setVariable["siren",true];
      [_veh,1] remoteExec ["life_fnc_medicSiren", -2, false];
     };
    };
   };
    _handled = true;
  };
 };
 //U Key
 case 22:{
  if(!_alt && !_ctrlKey) then {
   if(vehicle player == player) then {
    _curTarget = cursorTarget;
   } else {
    _curTarget = vehicle player;
   };
   if(_curTarget isKindOf "House_F" && playerSide == civilian) then {
    if(_curTarget in life_vehicles && player distance _curTarget < 8) then {
     _door = [_curTarget] call life_fnc_nearestDoor;
     if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
     _locked = _curTarget getVariable [format["bis_disabled_Door_%1",_door],0];
     if(_locked == 0) then {
      _curTarget setVariable[format["bis_disabled_Door_%1",_door],1,true];
      _curTarget animate [format["door_%1_rot",_door],0];
      systemChat localize "STR_House_Door_Lock";
     } else {
      _curTarget setVariable[format["bis_disabled_Door_%1",_door],0,true];
      _curTarget animate [format["door_%1_rot",_door],1];
      systemChat localize "STR_House_Door_Unlock";
     };
    };
   } else {
    _locked = locked _curTarget;
    if(_curTarget in life_vehicles && player distance _curTarget < 8) then {
     if(_locked == 2) then {
      if(local _curTarget) then {
       _curTarget lock 0;
      } else {
	   [_curTarget,0] remoteExec ["life_fnc_lockVehicle", _curTarget, false];
      };
      systemChat localize "STR_MISC_VehUnlock";
		[_curTarget,"car_unlock"] remoteExec ["life_fnc_soundPlay", 0, false];
     } else {
      if(local _curTarget) then {
       _curTarget lock 2;
      } else {
	   [_curTarget,2] remoteExec ["life_fnc_lockVehicle", _curTarget, false];
      };
      systemChat localize "STR_MISC_VehLock";
	  [_curTarget,"car_lock"] remoteExec ["life_fnc_soundPlay", 0, false];
     };
    }else{
     private["_typeOw","_typeOwner"];
     _typeOw = _curTarget getVariable"vehicle_info_owners";
     _typeOwner = _typeOw select 1;
     switch(_typeOwner)do{
      case "AAC":{
       if(life_onDuty)then{
        life_vehicles pushBack _curTarget;
       };
      };
     };
    };
   };
  };
  _handled = true;
 };
 case 48:{
  if(_shift) then {_handled = true;};
  if (_shift) then{
    _handled = true;
   if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then{
    if (player getVariable ["surrender", false]) then{
     player setVariable ["surrender", false, true];
    }else{
     [] spawn life_fnc_surrender;
    };
   };
  };
 };
   // Aus Forum  Das gewisse sachen Gelogt werden!
  case 62:{
  if(_alt && !_shift) then {
   diag_log format ["SERVER MELDUNG: %1 benutzte ALT+F4",_actor getVariable["realname",name _actor]];
   [1,format["SERVER MELDUNG: %1 benutzte ALT+F4",_actor getVariable["realname",name _actor]]] remoteExec ["life_fnc_broadcast", 0, false];
   _handled = true;
 };

    };
    case 211:{
  if(_ctrlKey && _alt)  then {
   diag_log format ["SERVER MELDUNG: %1 benutztev CTRL + ALT + DEL",_actor getVariable["realname",name _actor]];
	 [1,format["SERVER MELDUNG: %1 benutzte CTRL + ALT + DEL",_actor getVariable["realname",name _actor]]] remoteExec ["life_fnc_broadcast", 0, false];
   _handled = true;
  };
    };
    case 1:{
  if( _ctrlKey )  then {
   diag_log format ["SERVER MELDUNG: %1 benutzte CTRL + ESC",_actor getVariable["realname",name _actor]];
   [1,format["SERVER MELDUNG: %1 benutzte CTRL + ESC",_actor getVariable["realname",name _actor]]] remoteExec ["life_fnc_broadcast", 0, false];
   _handled = true;
  };
  };
 // aus dem Forum und interwebs, animationen, die das Leben des Spielers angenemer machen sollen.
 //Takwondo(Traditional Martial arts in korea)(Shift + num 1)
 case 79:{
  if(_shift) then {
  _handled = true;
  player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
  };
 };
 //Kneebend Slow(Shift + num 2)
 case 80:{
  if(_shift) then {
  _handled = true;
  player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
  };
 };
 //Kneebend Fast(Shift + num 3)
 case 81:{
  if(_shift) then {
  _handled = true;
  player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
  };
 };
 //Pushup(Shift + num4 )
 case 75:{
  if(_shift) then {
  _handled = true;
  player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
  };
 };
 // O, police gate opener   http://www.altisliferpg.com/topic/459-tutorial-cop-base-opener/
    case 24:{
  if (!_shift && !_alt && !_ctrlKey && ((playerSide in [west,independent]) || (life_onDuty)) && (vehicle player != player)) then {
   [] call life_fnc_copOpener;
  };
  if (_ctrlKey) then
  {
    if(!(playerSide in [civilian])) then
    {
      _obj = objNull;
      _objs = nearestObjects [player, ["Land_Net_Fence_Gate_F"], 35];
      _cntObjs = count _objs;
      _check = 0;

      if (_cntObjs > 0) then
      {
        _obj = _objs select 0;
        [_obj,10,"Gate"] execVM "core\actions\fn_remoteDoor.sqf";
        _check = 1;
      }
      else
      {
        _objs = nearestObjects [player, ["Land_BarGate_F"], 35];
        _cntObjs = count _objs;
          if (_cntObjs > 0) then
          {
            _obj = _objs select 0;
            [_obj,10,"Bar"] execVM "core\actions\fn_remoteDoor.sqf";
            _check = 1;
          };
        if(_check == 0) then {hint"Es ist kein Tor und keine Schranke in der Naehe. (35m)";};
      };
    };
  };
  _handled = true;
 };
 // enter
 case 28:{
  _handled = true;
  if(life_pendent)then{life_pendent = false};
 };
 case 209:{
  if(_shift) then{
   if (soundVolume != 1) then{
    1 fadeSound 1;
   titleText ["Du hast dir die Ohrstöpsel wieder entfernt.", "PLAIN"];}
  else{
    1 fadeSound 0.1;
   titleText ["Du hast dir Ohrstöpsel in das Ohr gesteckt.", "PLAIN"];};};
   _handled = true;
   };
 //EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Light_01_F"])) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
        _handled = true;
    };
 //Blinker:  Links, Q oder Useraction 2
/*case _blinkerLinks:{
  if(_shift)then{
    if(alive _veh && _veh != player && ((driver _veh) == player) ) then{
      [_veh,"left"] call life_fnc_BlinkerInit;
    };
  };
  if((!life_action_inUse) && (vehicle player == player) && (!(player getVariable "surrender")) && !_shift && !_alt && !_ctrlKey) then{
    {
      _str = [_x] call life_fnc_varToStr;
      _val = missionNameSpace getVariable _x;
      if(_val > 0 ) then{
        if( _str == "Spitzhacke" || _str == "pickaxe" ) then{
          [] spawn life_fnc_pickAxeUse;
        };
      };
    } foreach life_inv_items;
  };
///////////////////////////////////////////////////////////////////////////////
// AXT Benutzen.
	if((!life_action_inUse) && (vehicle player == player) && (!(player getVariable "surrender")) && !_shift && !_alt && !_ctrlKey) then{
		{
		  _str = [_x] call life_fnc_varToStr;
		  _val = missionNameSpace getVariable _x;
		  if(_val > 0 ) then{
			if( _str == "AXT" || _str == "axe" ) then{
			  [] spawn life_fnc_axtUse;
			};
		  };
		} foreach life_inv_items;
	  };
////////////////////////////////////////////////////////////////////////////////
};*/

// shift und - auf Numpad
case 74:
{
if (_shift && (((player getVariable ["cop_level", 0]) > 5) || ((player getVariable ["admin_level", 0]) > 0))) then{
//[] spawn life_fnc_delbodies;
[cursorTarget] remoteExec ["TON_fnc_vehicleDelete", 2, false];
};
_handled = true;
};


 //Blinker:  Rechts, E oder Useraction 1
 /*case _blinkerRechts:{
  if(_shift && alive _veh && _veh != player && ((driver _veh) == player) ) then{
   [_veh,"right"] call life_fnc_BlinkerInit;
  };
 }; */
 //Blinker:  Warn, Tab oder Useraction 3
 case _blinkerWarn:{
  if(alive _veh && _veh != player && ((driver _veh) == player) ) then{
   [_veh,"warning"] call life_fnc_BlinkerInit;
  };
  if (_blinkerWarn == 15 ) then{
   if( _alt)  then {
    diag_log format ["SERVER MELDUNG: %1 benutzte ALT + TAB",_actor getVariable["realname",name _actor]];
   };
  };
  _handled = true;
 };
};
life_key_handle = false;
} else {
_handled = true;
};
_handled
