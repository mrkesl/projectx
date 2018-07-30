/*
Ursprünglich nach : http://www.altisliferpg.com/topic/3276-uniform-for-medic-cop%C2%B4s-313/
das nach Blacklagoon gemacht wurde  WAS CRAP WAR !
Danke an Audacious....

Moded und editiert von Rage aka Ragebone aka Norman
Mit Pierre aka G00golplexian
für Nope-Gaming UND OP-Gaming ©
Diese Version ist für :
Libra-Gaming.eu

Support : TS3: nope-gaming.de
muss noch getestet werden...
*/

[]spawn{
	while{true}do{
		private["_uniform","_backpack"];
		_uniform = uniform player;
		_backpack = Backpack player;
		switch (_uniform)do{
			case "U_Rangemaster":{
				player setObjectTextureGlobal  [0,"textures\cops\uniformen\ng-norm.paa"];
			};
			case "U_B_CombatUniform_mcam_worn":{
				player setObjectTextureGlobal  [0,"textures\cops\uniformen\ng-kampf.paa"];
			};
			case "U_BG_Guerrilla_6_1":{
				player setObjectTextureGlobal  [0,"textures\cops\uniformen\ng-basic.paa"];
			};
			case "U_O_OfficerUniform_ocamo":{
				player setObjectTextureGlobal  [0,"textures\cops\uniformen\U_O_OfficerUniform_ocamo.paa"];
			};
			case "U_I_HeliPilotCoveralls":{
				player setObjectTextureGlobal  [0, "textures\Medic\kleidung.paa"];
			};
			case "U_Marshal":{
				player setObjectTextureGlobal [0, "textures\aac\uniaac.paa"];
			};
			case "U_B_SpecopsUniform_sgg":{
				player setObjectTextureGlobal [0, "textures\sol\anzug.paa"];
			};
			case "U_Competitor":{
				player setObjectTextureGlobal [0, "textures\sol\solpol.paa"];
			};
			case "U_BG_Guerilla2_3":{
				player setObjectTextureGlobal [0, "textures\jail.paa"];
			};
		};
		switch(_backpack)do{
			case "B_Bergen_blk":{
				(unitBackpack player) setObjectTextureGlobal [0,"textures\cops\uniformen\B_Bergen_blk.paa"];
			};
			case "B_Kitbag_rgr":{
				(unitBackpack player) setObjectTextureGlobal [0,"textures\cops\uniformen\backpack_fast_rgr_co.paa"];
			};
			case "B_Bergen_mcamo":{
				(unitBackpack player) setObjectTextureGlobal [0,"textures\Medic\rucksack.paa"];
			};
			case "B_Bergen_sgg":{
				(unitBackpack player) setObjectTextureGlobal [0,"textures\aac\aacruck.paa"];
			};
		};
		sleep 30;
	};
};
