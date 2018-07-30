/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Mod: Ragebone
	Description:
	Master configuration for vehicle colors.
	Black Magic!!!!  ; D
*/
params [["_vehicle", "", [""]]];
private["_ret","_path"];
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do{
	case "I_Heli_Transport_02_F":{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =	[
			["#(argb,8,8,3)color(0,0,0,1)","fed","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(0,0,0,1)","civ","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"],
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["textures\aac\mo1.paa","aac_air","textures\aac\mo2.paa","textures\aac\mo3.paa"],
			["#(argb,8,8,3)color(0,0,0,1)","donate","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"]
		];
	};
	case "C_Hatchback_01_sport_F":{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["textures\cops\hatchback\ng-hatchback.paa","cop"],
			["textures\zivilisten\limo-taxi.paa","civ"],
			["textures\zivilisten\limo-kitty.paa","civ"],
			["textures\zivilisten\limo_redgull.paa","civ"],
			["textures\zivilisten\limo_monster.paa","civ"]
		];
	};
	case "C_Offroad_01_F":{
		_ret = [
			["textures\cops\offroader\ng-offroad.paa","cop"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["textures\medic\offroader.paa","med"],
			["mpmissions\Libra_Life.Altis\textures\aac\aacoff.paa","aac"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","civ"],
			["textures\zivilisten\off-rock-rg.paa","civ"],
			["textures\zivilisten\off-rock-rl.paa","civ"],
			["textures\zivilisten\off-taxi.paa","civ"]
		];
	};

	case "C_Hatchback_01_F":{
		_ret =	[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};
	case "C_SUV_01_F":{
		_ret =[
			["textures\cops\suv\ng-suv1.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","cop"],
			["#(ai,64,64,1)Fresnel(1.3,7)","med"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\zivilisten\suv-monster.paa","civ"],
			["textures\zivilisten\suv-nyan.paa","civ"],
			["textures\zivilisten\suv-taxi.paa","civ"],
			["textures\zivilisten\suv-x6.paa","civ"],
			["textures\zivilisten\suv-monster.paa","donate"]
		];
	};
	case "C_Offroad_01_repair_F":{
		_ret =[
			["textures\aac\aacoff.paa","aac"]
		];
	};
	case "C_Boat_Civil_01_police_F":{
		_ret =[
			["textures\cops\motorboot\copboot.paa","cop"]
		];
	};
	case "B_Truck_01_transport_F":{
		_ret =[
			["textures\aac\aach.paa","aac"]
		];
	};
	case "O_Heli_Transport_04_F":{
		_ret =[
			["textures\aac\acc_taru_01.paa","aac_air","textures\aac\acc_taru_02.paa"],
			["#(argb,8,8,3)color(0,0,0,1)","cop","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"]
		];
	};
	case "B_Heli_Transport_03_unarmed_F":{
		_ret =[
			["#(argb,8,8,3)color(0,0,0,1)","aac_air","#(argb,8,8,3)color(0.7,0.7,0,0.5)","#(argb,8,8,3)color(0,0,0,1)"],
			["#(argb,8,8,3)color(0,0,0,1)","cop","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"]
		];
	};
	case "C_Van_01_box_F":{
		_ret = [
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\medic\rtw1.paa","med","textures\medic\rtw2.paa"]
		];
	};
	case "C_Van_01_transport_F":{
		_ret = [
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	case "I_Heli_light_03_unarmed_F":{
		_ret = [
			["textures\medic\hellcat.paa","med"],
			["textures\cops\hellcat\ng-hellcat1.paa","cop"]
		];
	};
	case "B_Heli_Transport_01_F":{
		_ret = [
			["textures\cops\ghost\ng-ghosthawk1.paa","cop","textures\cops\ghost\ng-ghosthawk2.paa"]
		];
	};
	case "B_Quadbike_01_F":{
		_ret = [
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	case "B_Heli_Light_01_F":{
		_ret = [
			["textures\cops\hummingbird\ng-hummingbird1.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["textures\zivilisten\humming-monster.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\medic\humming.paa","med"],
			["textures\zivilisten\humming-monster.paa","civ"]

		];
	};
	case "O_Heli_Light_02_unarmed_F":{
		_ret = 	[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["#(argb,8,8,3)color(1,1,1,0.8)","med"]
		];
	};
	case "B_MRAP_01_F":{
		_ret = [
			["textures\cops\hunter\ng-hunter1.paa","cop","textures\cops\hunter\ng-hunter2.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "I_MRAP_03_F":{
		_ret = [
			["textures\cops\strider\ng-strider1.paa","cop"]
			//["\A3\soft_F_beta\MRAP_03\data\mrap_03_ext_co.paa","reb"],
			//["\A3\soft_F_beta\MRAP_03\data\mrap_03_ext_indp_co.paa","reb"]
		];
	};
	case "O_MRAP_02_F":{
		_ret = [
			["\A3\soft_F\MRAP_02\data\mrap_02_ext_01_co.paa","reb","\A3\soft_F\MRAP_02\data\mrap_02_ext_02_co.paa"]
		];
	};
	case "I_Truck_02_covered_F":{
		_ret = 	[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\cops\zamak\ng-zamak1_1.paa","cop","textures\cops\zamak\ng-zamak2_2.paa"],
			["textures\medic\zamak.paa","med","textures\medic\zamak3.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "I_Truck_02_transport_F":{
		_ret = 	[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "B_APC_Wheeled_01_cannon_F":{
		_ret = 	[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "O_Heli_Attack_02_black_F":{
		_ret = 	[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "B_MRAP_01_hmg_F":{
		_ret = [
			["textures\cops\hunter\ng-hunter1.paa","cop","textures\cops\hunter\ng-hunter2.paa"]
			//["#(argb,8,8,3)color(0.518,0.519,0.455,0.2)","cop"]
		];
	};
	case "O_APC_Wheeled_02_rcws_F":{
		_ret = [
			["textures\cops\Marid\ng-marid1.paa","cop","textures\cops\Marid\ng-marid2.paa","textures\cops\Marid\ng-marid3.paa"]
		];
	};
};

_ret;
