/*
        File: fn_bind.sqf
        Author: Bryan "Tonic" Boardwine / Ragebone
        
        Description:
        zipties the client.
*/
params [["_bandit", Objnull, [Objnull]]];
private "_player";
_player = player;
if(isNull _bandit) exitWith {};
titleText["Sie wurden mit einem Kabelbinder gefesselt","PLAIN"];
                                
while {player getVariable "gefesselt"} do
{
        removeAllActions player;
        if(vehicle player == player) then {
                player playMove "AmovPercMstpSnonWnonDnon_Ease";
        };
        
        _state = vehicle player;
        waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "gefesselt") || vehicle player != _state};
                        
        if(!alive player) exitWith
        {
                player setVariable ["gefesselt",false,true];
                player setVariable ["transport",false,true];
                player setVariable ["imFahrzeug",false,true]; 
                detach _player;
        };
        
        if(!alive _bandit) exitWith {
                player setVariable ["transport",false,true];
                detach player;
        };
        
        if(vehicle player != player) then
        {
                //disableUserInput true;
                if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
        };
};
disableUserInput false;
                
if(alive player) then
{
        player switchMove "";
        player setVariable ["gefesselt",false,true];
        player setVariable ["transport",false,true];
        player setVariable ["imFahrzeug",false,true]; 
        detach player;
};
