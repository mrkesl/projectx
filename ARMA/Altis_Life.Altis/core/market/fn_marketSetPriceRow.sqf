/*

	[] fnc [SHORTNAME, [PRICEROW], (send?)];

*/
params [["_shortname", "", [""]], ["_price", [], [[]]], ["_send", true, [true]]];
{
	if((_x select 0) == _shortname) exitWith
	{
		life_market_prices set [_forEachIndex, _price];
	};
}
foreach life_market_prices;
if(_send) then {publicVariable "life_market_prices";};
