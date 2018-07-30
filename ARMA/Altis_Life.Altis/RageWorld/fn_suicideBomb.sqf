/*
    ALAH SNACKBAR!
    Created By: TAW_Tonic
    Edited By: MidgetGrimm, PeterBeer, Xetoxyc, Larvell
	Final by Larvell from Libra-Gaming.eu
    Tested and Approved by: Larvell from Libra-Gaming.eu
*/
params [["_unit", Objnull, [Objnull]]];
private["_test"];
if(vest player != "V_HarnessOGL_gry") exitWith {};
removeAllActions player;
player addEventHandler ["InventoryOpened", { deleteVehicle (_this select 1); }];
[_unit] remoteExec ["life_fnc_countdown", 0, false];
sleep 15;
sleep 15;
[0,format["%1 schreit Allahu Akbhar!",name player]] remoteExec ["life_fnc_broadcast", 0, false];
removeVest player; 
player removeAllEventHandlers "InventoryOpened";
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];
if(alive player) then {player setDamage 1;};
[] spawn life_fnc_setupActions;