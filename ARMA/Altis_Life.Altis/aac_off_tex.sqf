vehInit ={
	if (_this iskindof "C_Offroad_01_repair_F") then {
		_this setObjectTextureGlobal[0,"textures\aac\aacoff.paa"];
		_this setVariable["life_VEH_color",0,TRUE];
		_this setVariable["vehicle_info_owners",[[0000000,"AAC"]],TRUE];
		_this setRepairCargo 0;
		_this setVariable ["xcar","aac_car",true];
		_this setVariable ["trunk_in_use",false,true];
		_this lock 2;//HALLO VLAD
	};
};
