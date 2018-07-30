
/*
	@file Title: Uniform/Backpack Texture Sync by Creedcoder
	@file Version: 1.0
	@file Name: fn_texturesync.sqf
	@file Author: Creedcoder
	@file Edit: 22.11.2015
	Copyright © 2015 Creedcoder, All rights reserved!

	Do not edit/use without permission!

  Only for Libra-Gaming.eu!!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

*/
if(isNil "Tex_Sync_EH_1") then {
  Tex_Sync_EH_1 = player addEventHandler ["Take", {
    [(getObjectTextures player) select 0, (uniformContainer player) getVariable["texture",""]] params [["_texUniform",nil,[""]],["_texCustom",nil,[""]]];
  	if (isNil "_texCustom" OR isNil "_texUniform") exitWith {};
    if (_texCustom == "") exitWith {};
  	if (_texUniform == _texCustom) exitWith {};
    player setObjectTextureGlobal [0, _texCustom];
  	false
  }];
  Tex_Sync_EH_2 = player addEventHandler ["Take", {
  	if(getNumber(configFile >> "CfgVehicles" >> (_this select 2) >> "isBackpack") == 0) exitWith {};
    [(getObjectTextures (backpackContainer player)) select 0, (backpackContainer player) getVariable["texture",""]] params [["_backpacktex",nil,[""]],["_backpacktexCustom",nil,[""]]];
    if (isNil "_backpacktexCustom" OR isNil "_backpacktex") exitWith {};
    if (_backpacktex == _backpacktexCustom) exitWith {};
    (backpackContainer player) setObjectTextureGlobal [0, _texCustom];
    false
  }];
  true spawn {
    while {true} do {
      uiSleep 30;
      (getObjectTextures player + [(uniformContainer player) getVariable "texture"]) params ["_texUniform", "_texInsignia", "_texCustom"];
      if (!isNil "_texCustom") then {
        if (_texUniform != _texCustom && _texCustom != "") then {
          player setObjectTextureGlobal [0, _texCustom];
        };
      };
    };
  };
};

params [
  ["_classname",nil,[""]]
];
if (isNil "_classname") exitWith {};

waitUntil {!isNull (uniformContainer player) && (uniform player == _classname OR backpack player == _classname)};

_texture = switch (_classname) do {
  case "U_Rangemaster":{
    "textures\cops\uniformen\ng-norm.paa"
  };
  case "U_B_CombatUniform_mcam_worn":{
    "textures\cops\uniformen\ng-kampf.paa"
  };
  case "U_BG_Guerrilla_6_1":{
    "textures\cops\uniformen\ng-basic.paa"
  };
  case "U_O_OfficerUniform_ocamo":{
    "textures\cops\uniformen\U_O_OfficerUniform_ocamo.paa"
  };
  case "U_I_HeliPilotCoveralls":{
    "textures\Medic\kleidung.paa"
  };
  case "U_B_HeliPilotCoveralls":{
    "textures\aac\aac_uni.paa"
  };
  case "U_BG_Guerilla2_3":{
    "textures\jail.paa"
  };
  case "B_Bergen_blk":{
    "textures\cops\uniformen\B_Bergen_blk.paa"
  };
  case "B_Kitbag_rgr":{
    "textures\cops\uniformen\backpack_fast_rgr_co.paa"
  };
  case "B_Bergen_mcamo":{
    "textures\Medic\rucksack.paa"
  };
  case "B_Bergen_sgg":{
    "textures\aac\aac_backpack.paa"
  };
  default {
      ""
  };
};
if (_texture == "") exitWith {};
if(_classname select [0,1] == "U") then {
  player setObjectTextureGlobal [0, _texture];
  (uniformContainer player) setVariable ["texture", _texture, true];
};
if(_classname select [0,1] == "B") then {
  (backpackContainer player) setObjectTextureGlobal [0, _texture];
  (backpackContainer player) setVariable ["texture", _texture, true];
};
