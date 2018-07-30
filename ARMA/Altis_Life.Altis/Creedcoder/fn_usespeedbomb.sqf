/*
    File: fn_usespeedbomb.sqf
    Author: stolzerrabe (from fuelpipe)
    Modified: Larvell (for speedbomb)
*/
disableSerialization;
private["_veh","_uip","_progress","_pgText","_cP","_upp"];
_veh = cursorTarget;
if(isNull _veh) exitwith {};
if(vehicle player != player) exitWith {hint "Du sitzt im Fahrzeug. Das funktioniert nicht";};
if((player distance _veh) > 5) exitwith {hint "Du musst näher am Fahrzeug stehen.";};
if(!(_veh isKindOF "LandVehicle") && !(_veh isKindOf "Air") && !(_veh isKindOf "Ship")) exitWith { hint "Kein Fahrzeug";};
if(!(isNull (driver _veh))) exitWith { hint "Es sitzt jemand im Fahrzeug. Das wird er merken!"; };
_var_item = ["speedbomb",0] call life_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {hint "Du hast kein Autoradio dabei";};
life_action_inUse = true;

// ESTELLE DIE PROZESSBAR!
        _upp = "Du bringst das Autoradio an :p";
        5 cutRsc ["life_progress","PLAIN"];
        _uip = uiNameSpace getVariable "life_progress";
        _progress = _uip displayCtrl 38201;
        _pgText = _uip displayCtrl 38202;
        _pgText ctrlSetText format["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;
        while{true} do
        {
            if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then
            {
                player action ["SwitchWeapon", player, player, 100];   //EDIT
                player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
                player playActionNow "stop";
                player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
                player playActionNow "stop";
                player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
            };
            sleep 0.195;
            _cP = _cP + 0.01;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if(_cP >= 1) exitWith {};
            if((player distance _veh) > 5) exitwith {hint "Du hast dich zu weit entfernt.";};
        };
        5 cutText ["","PLAIN"];
// PROZESSBAR ENDE
[false,"speedbomb",1] call life_fnc_handleInv;
_netid = netId _veh;
[_netid] remoteExec ["CC_fnc_speedbomb", 2, false];
life_action_inUse = false;
sleep 1;
hint "Das Autoradio ist verbaut :p";
