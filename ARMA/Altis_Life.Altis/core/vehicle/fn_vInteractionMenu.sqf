/*
        File: fn_vInteractionMenu.sqf
        Author: Bryan "Tonic" Boardwine
        Edit: Creedcoder
        Description:
        Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Title 37401
private["_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
        createDialog "vInteraction_Menu";
};
disableSerialization;
params [["_curTarget", Objnull, [Objnull]]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
life_vInact_curTarget = _curTarget;
//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";
if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
if(playerSide == west) then {
        _Btn2 ctrlSetText localize "STR_vInAct_Registration";
        _Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

        _Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
        _Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";

        _Btn4 ctrlSetText localize "STR_vInAct_PullOut";
        _Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
        if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

        _Btn5 ctrlSetText localize "STR_vInAct_Impound";
        _Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";

        if(_curTarget isKindOf "Ship") then {
                _Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
                _Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
                if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
        } else {
                if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
                        _Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
                        _Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
                        if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
                } else {
                        _Btn6 ctrlSetText localize "STR_vInAct_Unflip";
                        _Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
                        if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
                };
        };
        if((player getVariable ["cop_level", 0]) > 1) then {
          if({_x getvariable["onDuty", false]} count allPlayers > 0) then {
            _Btn7 ctrlSetText "AAC beauftragen";
            _Btn7 buttonSetAction "
              [life_vInact_curTarget] remoteExec [""life_fnc_aac_lockvehicle"", life_vInact_curTarget, false];
              [player,format[""Nationalgarde %1"",name player],(""Im Namen der Nationalgarde soll das Fahrzeug vom Typ "" + typeOf life_vInact_curTarget + "" abgeschleppt und entsprechend verwahrt werden.<br/>Die Situation vor Ort wurde geklaert und das Fahrzeug gesichert.<br/><br/>Wir danken für ihre Mitarbeit.""),getposATL life_vInact_curTarget] remoteExec [""life_fnc_aac_newtask"", -2, false];
              hint ""Der Altis Automobil Club wurde informiert!"";
            ";
          } else {
            _Btn7 ctrlSetText "Verwahren";
            _Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_permimpoundAction;";
          }
        } else {
          _Btn7 ctrlEnable false;
        };


} else {

        if(_curTarget isKindOf "Ship") then {
                _Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
                _Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
                if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
        } else {
                if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
                        _Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
                        _Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
                        if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
                } else {
                        _Btn2 ctrlSetText localize "STR_vInAct_Unflip";
                        _Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
                        if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
                };
        };

        if(typeOf _curTarget == "O_Truck_03_device_F") then {
                _Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
                _Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
                if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
                        _Btn3 ctrlEnable false;
                } else {
                        _Btn3 ctrlEnable true;
                };
        } else {
                _Btn3 ctrlShow false;
        };
 if(playerSide == civilian) then {
  _Btn4 ctrlSetText localize "STR_vInAct_PullOut";
  _Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_ausFahrzeugAction;";
 } else {
  //_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
  _Btn4 ctrlSetText "Aufschneiden";
  _Btn4 buttonSetAction "
_locked = locked life_vInact_curTarget;
if(_locked == 2) then {
	if(local life_vInact_curTarget) then {
		life_vInact_curTarget lock 0;
	} else {
		[life_vInact_curTarget,0] remoteExec [""life_fnc_lockVehicle"", life_vInact_curTarget, false];
	};
	systemChat localize ""STR_MISC_VehUnlock"";
	[life_vInact_curTarget,""car_unlock""] remoteExec [""life_fnc_soundPlay"", 0, false];
} else {
	if(local life_vInact_curTarget) then {
		life_vInact_curTarget lock 2;
	} else {
		[life_vInact_curTarget,2] remoteExec [""life_fnc_lockVehicle"", life_vInact_curTarget, false];
	};
	systemChat localize ""STR_MISC_VehLock"";
	[life_vInact_curTarget,""car_lock""] remoteExec [""life_fnc_soundPlay"", 0, false];
};
";
 };
        if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
        _Btn5 ctrlShow false;
        if(player getvariable["onDuty", false]) then {
          _Btn6 ctrlSetText "Sicherrung";
          _Btn6 buttonSetAction "[life_vInact_curTarget] remoteExec [""life_fnc_aac_lockvehicle"", life_vInact_curTarget, false];";
        } else {
          _Btn6 ctrlEnable false;
        };
        if(player getvariable["onDuty", false] && {player distance _x <= 10} count [verwahr_1, verwahr_2] > 0) then {
          _Btn7 ctrlSetText "Verwahren";
          _Btn7 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_permimpoundAction;";
        } else {
          _Btn7 ctrlEnable false;
        };
};
