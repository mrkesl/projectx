/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],

	["oilp", 3200, 2500, 5000, 4, 2,
		[
			["diamondc",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["uranium",1]
		]
	],

	["woodi", 2000, 500, 3500, 4, 2,
		[
			["diamondc",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["uranium",1],
			["joint",1]
		]
	],

	["iron_r", 3500, 3200, 6500, 4, 4,
		[
			["diamondc",1],
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["uranium",1]
		]
	],

	["diamondc", 3000, 1750, 5250, 4, 2,
		[
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["uranium",1]
		]
	],

	["copper_r", 2100, 1800, 4000, 4, 4,
		[
			["diamondc",1],
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1],
			["uranium",1]
		]
	],

	["salt_r", 2000, 1250, 3750, 4, 3,
		[
			["diamondc",1],
			["oilp",4],
			["iron_r",3],
			["copper_r",3],
			["cement",2],
			["glass",2],
			["uranium",1]
		]
	],

	["glass", 2000, 1150, 3450, 4, 3,
		[
			["diamondc",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["uranium",1]
		]
	],

	["cement", 2100, 950, 2850, 4, 3,
		[
			["diamondc",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1],
			["uranium",1]
		]
	],

	["bottledbeer", 3000, 1300, 5500, 4, 2,
		[
			["copper_r",1],
			["glass",1],
			["bottledwhiskey",1],
			["bottledshine",1],
			["uranium",1]
		]
	],

	["bottledwhiskey", 3400, 1200, 6000, 4, 2,
		[
			["copper_r",1],
			["glass",1],
			["bottledbeer",1],
			["bottledshine",1]
		]
	],

	["goldbarp", 45000, 30000, 120000, 4, 4,
		[
			["iron_r",1],
			["copper_r",3],
			["diamondc",1],
			["goldbar",1]
		]
	],

	["turtle", 5500, 2500, 10000, 4, 4,
		[
			["marijuana",3],
			["cocainep",2],
			["heroinp",2],
			["joint",3],
			["salt_r",1],
			["copper_r",1]
		]
	],

	["marijuana", 2900, 2500, 5250, 4, 4,
		[
			["turtle",1],
			["cocainep",1],
			["heroinp",1],
			["cannabis",1],
			["diamondc",1],
			["iron_r",2],
			["copper_r",2],
			["salt_r",1],
			["cement",3],
			["glass",3],
			["uranium",2],
			["joint",2]
		]
	],

	["joint", 3100, 3000, 7700, 4, 4,
		[
			["turtle",1],
			["cocainep",1],
			["heroinp",1],
			["cannabis",1],
			["diamondc",1],
			["iron_r",2],
			["copper_r",2],
			["salt_r",1],
			["cement",3],
			["glass",3],
			["uranium",2],
			["marijuana",3]
		]
	],

	["cocainep", 3900, 2500, 7000, 4, 4,
		[
			["marijuana",2],
			["turtle",1],
			["heroinp",4],
			["cocaine",1],
			["diamondc",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",2],
			["glass",2],
			["uranium",2]
		]
	],

	["heroinp", 3400, 2500, 6500, 4, 4,
		[
			["marijuana",2],
			["turtle",1],
			["cocainep",4],
			["heroinu",1],
			["diamondc",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",2],
			["glass",2],
			["uranium",2]
		]
	],

	["goldbar", 45000, 25000, 140000, 4, 4,
		[
			["iron_r",1],
			["copper_r",1],
			["diamondc",1],
			["goldbarp",1],
			["diamondc",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		]
	],

	["bottledshine", 3600, 1200, 6000, 4, 2,
		[
			["copper_r",2],
			["glass",1],
			["bottledbeer",3],
			["bottledwhiskey",3],
			["uranium",2]
		]
	],

	["heroinu", 550, 350, 1150, 4, 2,
		[
			["heroinp",1],
			["cocaine",1],
			["cannabis",1],
			["uranium",1]
		]
	],

	["cocaine", 550, 350, 1150, 4, 2,
		[
			["cocainep",1],
			["heroinu",1],
			["cannabis",1],
			["uranium",1]
		]
	],

	["cannabis", 550, 350, 1150, 4, 2,
		[
			["marijuana",1],
			["heroinu",1],
			["cocaine",1],
			["uranium",1]
		]
	],

	["uranium", 25000, 15000, 70000, 4, 3,
		[
			["marijuana",1],
			["heroinu",1],
			["cocaine",1],
			["copper_r",1],
			["diamondc",1],
			["iron_r",3],
			["salt_r",2],
			["cement",2],
			["glass",2]
		]
	]
];

publicVariable "life_market_resources";

//GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

//SYNC PRICES WITH SERVER IF EMPTY
if(isNil("life_market_prices")) then
{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{

		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;

	publicVariable "life_market_prices";

	systemChat "Market Prices Generated!";
};
