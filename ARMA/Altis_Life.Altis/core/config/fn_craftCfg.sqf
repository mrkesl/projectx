#include <macro.h>
/*
        File: fn_craftCfg.sqf
        Author: EdgeKiller
                Modified: mrk, Sears

        Description:
        Master configuration file for the crafting menu.

*/
params [["_craft", "", [""]]];
private["_return"];
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
        case "weapon":
        {
                _return = [
                                //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
                                ["srifle_GM6_camo_F", ["life_inv_blynx1",1,"life_inv_blynx2",1,"life_inv_blynx3",1,"life_inv_bolzen",3,"life_inv_gschaft",1,"life_inv_feder",5,"life_inv_spulver",4,"life_inv_vhalterung",1,"life_inv_schrauben",20,"life_inv_abzug",1,"life_inv_glauf",1]],
                                ["srifle_LRR_F", ["life_inv_blrr1",1,"life_inv_blrr2",1,"life_inv_bolzen",2,"life_inv_feder",4,"life_inv_glauf",1,"life_inv_spulver",2,"life_inv_schrauben",15,"life_inv_abzug",1,"life_inv_gschaft",1]],
                               ["LMG_Zafir_F", ["life_inv_bzafir",1,"life_inv_glauf",1,"life_inv_abzug",1,"life_inv_schrauben",30,"life_inv_vhalterung",1,"life_inv_spulver",2,"life_inv_gschaft",1]]
                         ];
        };

		case "launcher":
        {
                _return = [
                                //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
                                ["launch_B_Titan_short_F", ["life_inv_btitan1",1,"life_inv_btitan2",1,"life_inv_copperr",4,"life_inv_feder",6,"life_inv_vhalterung",1,"life_inv_spulver",1,"life_inv_schrauben",25,"life_inv_abzug",1]]
                         ];
        };
		
		case "handgun":
        {
                _return = [
                                //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
                                ["hgun_ACPC2_F", ["life_inv_schrauben",5,"life_inv_feder",3,"life_inv_plauf",1]],
								["hgun_Pistol_heavy_02_F", ["life_inv_schrauben",3,"life_inv_feder",7,"life_inv_plauf",1,"life_inv_vhalterung",1]],
								["hgun_Rook40_F", ["life_inv_schrauben",2,"life_inv_feder",3,"life_inv_plauf",1]]
                         ];
        };
				
        case "uniform":
        {
                _return = [
                                //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
                                ["V_RebreatherB", ["life_inv_sflasche",2,"life_inv_npren",3,"life_inv_nadel",1,"life_inv_gfaden",2,"life_inv_cstoff",5]],
								["U_BG_leader", ["life_inv_cstoff",4,"life_inv_nadel",1,"life_inv_sfetzen",2,"life_inv_ofaden",2]],
								["U_IG_Guerilla1_1", ["life_inv_sfetzen",3,"life_inv_cstoff",4,"life_inv_nadel",1,"life_inv_gfaden",1]],
								["U_I_OfficerUniform", ["life_inv_cstoff",4,"life_inv_nadel",1,"life_inv_sfaden",4,"life_inv_gfaden",1]],
								["U_I_CombatUniform_shortsleeve", ["life_inv_cstoff",10,"life_inv_nadel",1,"life_inv_ofaden",2,"life_inv_gfaden",1,"life_inv_sfetzen",2,"life_inv_sfaden",1]],
								["U_O_GhillieSuit", ["life_inv_cstoff",10,"life_inv_nadel",3,"life_inv_ofaden",5,"life_inv_gfaden",10,"life_inv_sfetzen",4,"life_inv_sfaden",8]]									
								
                        ];
        };
		case "magazin":
		{
				_return = [
								 //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
								["9Rnd_45ACP_Mag", ["life_inv_pat",9,"life_inv_al",3,"life_inv_spulver",9]],
								["6Rnd_45ACP_Cylinder", ["life_inv_pat",6,"life_inv_al",8,"life_inv_spulver",10]],
								["16Rnd_9x21_Mag", ["life_inv_pat",16,"life_inv_al",5,"life_inv_spulver",20]],
								["5Rnd_127x108_Mag", ["life_inv_pat",5,"life_inv_al",25,"life_inv_spulver",25]],
								["7Rnd_408_Mag", ["life_inv_pat",7,"life_inv_al",20,"life_inv_spulver",20]],
								["150Rnd_762x54_Box", ["life_inv_patg",5,"life_inv_al",30,"life_inv_spulver",35]]
                        ];
        };
        case "item":
        {
                _return = [
                                //[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
                                ["life_inv_redgull", ["life_inv_donuts",1,"life_inv_coffee",2,"life_inv_water",1]],
								["life_inv_lockpick", ["life_inv_schmuck",1,"life_inv_feder",2,"life_inv_nadel",3]],
                                ["life_inv_storagesmall", ["life_inv_uranium",1,"life_inv_copperr",10,"life_inv_ironr",10]],
								["life_inv_storagebig", ["life_inv_uranium",5,"life_inv_copperr",10,"life_inv_ironr",10]],
								["life_inv_kabelbinder", ["life_inv_ssenkel",6]],
								["life_inv_blastingcharge", ["life_inv_uranium3",1,"life_inv_spulver",10,"life_inv_schrauben",5]],
								["life_inv_underwatercharge", ["life_inv_uranium3",3,"life_inv_spulver",10,"life_inv_schrauben",5]]
								
								
                ];
        };
};

_return; 

