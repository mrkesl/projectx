/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(player getVariable "gefesselt") then
{
	detach player;
	player setVariable["transport",false,true];
	player setVariable["imFahrzeug",false,true];
};

player action ["Eject", vehicle player];
titleText[localize "STR_NOTF_PulledOut","PLAIN"];
titleFadeOut 4;