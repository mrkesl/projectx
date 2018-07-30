class VehUpgrades {
	idd = 3494;
	name= "VehUpgrades";
	movingEnable = 0;
	enableSimulation = 1;

  class controlsBackground {
      
      class Main_Back: IGUIBack
            {
            	idc = 50000;
            	x = 0.365937 * safezoneW + safezoneX;
            	y = 0.291 * safezoneH + safezoneY;
            	w = 0.268125 * safezoneW;
            	h = 0.341 * safezoneH;
            };
      class title: RscText
            {
            	idc = 50001;
            	text = "Fahrzeugupgrades";
            	x = 0.45875 * safezoneW + safezoneX;
            	y = 0.302 * safezoneH + safezoneY;
            	w = 0.0825 * safezoneW;
            	h = 0.044 * safezoneH;
            };               
};
  class controls {

      class Veh_Infos: Life_RscListBox
            {
            	idc = 50002;
            	onLBSelChanged = "[] spawn life_fnc_upgradeinfo";
            	x = 0.37625 * safezoneW + safezoneX;
            	y = 0.357 * safezoneH + safezoneY;
            	w = 0.144375 * safezoneW;
            	h = 0.198 * safezoneH;
            };
      class specs: Life_RscListBox
            {
            	idc = 50003;
            	x = 0.525781 * safezoneW + safezoneX;
            	y = 0.412 * safezoneH + safezoneY;
            	w = 0.103125 * safezoneW;
            	h = 0.143 * safezoneH;
            };
      class Close_Button: Life_RscButtonMenu
            {
            	idc = 50004;
            	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
            	text = "Schließen"; 
            	onButtonClick = "closeDialog 0;";
            	x = 0.427812 * safezoneW + safezoneX;
            	y = 0.577 * safezoneH + safezoneY;
            	w = 0.149531 * safezoneW;
            	h = 0.033 * safezoneH;
            	class Attributes 
            {
                align = "center";
            };
            };
      class Upgrade_Button: Life_RscButtonMenu
            {
            	idc = 50005;
            	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
            	text = "Fahrzeug upgraden!";
            	onButtonClick = "[] spawn life_fnc_upgradeselect;";
            	x = 0.525781 * safezoneW + safezoneX;
            	y = 0.357 * safezoneH + safezoneY;
            	w = 0.103125 * safezoneW;
            	h = 0.040 * safezoneH;
            	class Attributes 
            {
                align = "center";
            };
            };
      };
};
