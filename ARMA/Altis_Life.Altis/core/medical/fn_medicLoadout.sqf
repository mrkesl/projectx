/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
player forceAddUniform "U_I_HeliPilotCoveralls";
["U_I_HeliPilotCoveralls"] spawn life_fnc_texturesync;
player addBackpack "B_Bergen_mcamo";
["B_Bergen_mcamo"] spawn life_fnc_texturesync;
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "Medikit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
player unlinkItem (hmd player);
};

if (playerSide == independent) then {
	if((player getVariable ["medic_level", 0]) == 1) then {
		player setObjectTextureGlobal  [0,"textures\medic\kleidung.paa"];
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,"rucksack.paa"];};
	};

	if((player getVariable ["medic_level", 0]) == 2) then {
		player setObjectTextureGlobal  [0,"textures\medic\kleidung.paa"];
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,"rucksack.paa"];};
	};
};
life_inv_redgull = 10;
life_inv_tbacon = 10;
