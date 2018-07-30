class Socket_Reciever
{
	tag = "REDIS";
	class SQL_Socket
	{
		file = "core\redis";
		class load {};
		class save {};
	};
};

class Life_Client_Core
{
	tag = "life";

	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class welcomeNotification {};
	};

	class speedbomb
	{
		file= "Creedcoder";
		class usespeedbomb {};
		class bankmission {};
		class texturesync {};
		class getin {};
	};


	class Admin
	{
		file = "core\admin";
		class adm_gd_tg {};
		class car_gd_tg {};
		class adminFreeze {};
		class adminFreeze_all {};
		class adminRevive {};
		class adminrevived {};
		class adm_g_loadout {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class teamMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicLights {};
		class medicSiren {};
		class medLicenseShown {};
		class medShowLicense {};
	};

	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class permimpoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class craftAction {};
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class vehicleWeightCfgboxed {};
		class houseConfig {};
		class craftCfg {};
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_med {};
		class clothing_aac {};
		class clothing_sol {};
		class clothing_wiss {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class AAN {};
		// PermaWanted
		class wantedAddP {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class cellphone2 {};
	};


	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class knockSound {};
		class countdown {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class keyHandlerddown {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class emptyFuel {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class randomRound {};
		class callCellPhone {};
		class gatherUranium {};
		class processActionDual {};
		class processActionLsd {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};

	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
		class freezePlayer {};
		class freezePlayer_all {};
		class noAdmin {};
		class civShowLicense {};
		class civLicenseShown {};
		class Stempelkarte {};
		class soeldnerpass {};
	};

	class AAC
	{
		file = "core\aac";
		class aac_income {};
		class aac_newtask {};
		class aac_stamp {};
		class aac_vehicles {};
		class aac_lockvehicle {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class vehicleWeightboxed {};
		class deviceMine {};
		class addVehicle2Chain {};
	};

	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class copSiren1 {};
		class copSiren2 {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		// Perma wanted.
		class wantedGrab {};
		class copShowLicense {};
		class copLicenseShown {};
		// Test Del.
		class delObjectstest {};
	};

	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class groupMarkers{};//*added for gangmarkers by sears
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class atmGangMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class copgear{};
	};

	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class weed {};
		class koka {};
		class hero {};
		class muell {};
		class axtUse {};
	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class pimpoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class pimpgarageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class gangbankDeposit {};
		class gangbankWithdraw {};
		//class calldialog {};
		//class sendChannel {};
	};
    class Market
    {
    file = "core\market";
    class openMarketView;
    class refreshMarketView;
    class marketShortView;
    class marketBuy;
    class marketSell;
    class marketGetBuyPrice;
    class marketGetSellPrice;
    class marketconfiguration;
    class marketReset;
    class marketChange;
    class marketGetRow;
    class marketGetPriceRow;
    class marketSetPriceRow;
    };

	class RageWorld
	{
		file = "RageWorld";
		class RageInit {};
		class copOpener {};
		class whoDunnit {};
		class teargas {};
		class robShops {};
		class surrender {};
		class suicideBomb {};
		class soundPlay {};
		class autoSave {};
	};
	class RageWorld_gold
	{
		file = "RageWorld\gold";
		class underwaterCharge {};
		class waterChargeTimer {};
		class safeInvGold {};
		class safeGold {};
		class goldTake {};
	};
	class RageWorld_items
	{
		file = "RageWorld\items";
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class placeItem {};
	};
	class RageWorld_Staat
	{
		file = "RageWorld\Staat";
		class breathalyzer {};
		class radarCam {};
		class EinsatzLicht {};
		class UcopLights {};
		class aacLights {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
	};
	class RageWorld_blinker
	{
		file = "RageWorld\blinker";
		class BlinkerInit {};
		class BlinkerLinks {};
		class BlinkerRechts {};
		class WarnBlinker {};
	};

	class RageWorld_restrain
	{
		file = "RageWorld\restrain";
		class ausFahrzeug {};
		class ausFahrzeugAction {};
		class entfessel {};
		class fessel {};
		class insFahrzeug{};
		class InteractionMenu {};
		class kabelbinderAction {};
		class stopTransport {};
		class TransportAction {};
	};
	class Special
	{
		file = "core\special";
		class openEmpMenu {};
		class isEmpOperator {};
		class scanVehicles {};
		class warnVehicle {};
		class empVehicle {};
		class vehicleWarned {};
		class vehicleEmpd {};
	};
	class extended_sql_smartphone
	{
		file = "Larvell\sp";
		class initphone{};
		class extsmartphone{};
		class changenumber{};
	};
	class setglobals
	{
		file = "Larvell\global";
		class set_global{};
	};
	class eegs
	{
		file = "Larvell\eeg";
		class eeg1{};
	};
	class admin_menu
	{
		file = "Larvell\admin";
		class admin_menu{};
		class admin_log{};
		class admin_db_menu{};
		class admin_db_menu_fill{};
		class admin_db_menu_list{};
	};
	class notstand
	{
		file = "Larvell\notstand";
		class notstand{};
		class notstand_aktiv{};
	};

	class DelBodies
	{
		file = "Timstestarena\action74";
		class delbodies{};
	};

	class restraingear
	{
		file = "Timstestarena\restraingear";
		class opengear{};
		class opengearcop{};
	};

	class upgrade
	{
		file = "Timstestarena\upgrades";
		class umenue{};
		class addbox{};
		class openupgrade{};
		class vehsearch{};
		class upgradeselect{};
		class upgradeinfo{};
	};
};
