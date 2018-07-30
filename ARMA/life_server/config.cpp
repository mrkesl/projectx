class CfgPatches
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"};
	};
};

class CfgFunctions
{

	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedCrimes {};
		};
		class Client_Code
		{
			file = "\life_server\Functions\Client";
		};

		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
			class jailTimer {};
			class jailPlayer {};
		};
		class Adminauth
		{
			file = "\life_server\Functions\Larvell\Admin";
			class admin_auth {};
		};
		class Phonenumber
		{
			file = "\life_server\Functions\Larvell\Phone";
			class generate_number {};
		};
		class Restart
		{
			file = "\life_server\Functions\Larvell";
			class restart {};
		};
	};

    class Tim_System
	{
		tag = "TIM";
		class fuelsave
		{
			file = "\life_server\Functions\TimsTest";
			class fuellevel {};
		};
	};

	class LAR_System
	{
		tag = "LAR";
		class globals
		{
			file = "\life_server\Functions\Larvell";
			class global {};
		};
	};

	class CC_System
	{
		tag = "CC";
		class globals
		{
			file = "\life_server\Functions\Creedcoder";
			class speedbomb {};
		};
	};

	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class getpimpVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class vehicleReset {}; //Creedcoder Redis
			class spikeStrip {};
			class logIt {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
		};

		class Airdrop
		{
			file = "\life_server\Functions\airdrop";
			class generateAirdrop {};
		};

		class drop
		{
             file = "\life_server\Functions\TimsTest";
             class quaddrop {};
        };

		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
		};

		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};
		class Rageworld_gold
		{
			file = "\life_server\Functions\RageWorld\gold";
			class goldUpdate {};
			class spawnGold {};
		};

		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class cleanupMessages {};
		};
		class RageWorld
		{
			file = "\life_server\Functions\RageWorld";
			class logIt {};
		};
		class upgradevehicle
		{
             file = "\life_server\Functions\TimsTest";
             class upgrade {};
        };
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};

	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM '\life_server\fix_headgear.sqf'";
		};
	};
};
