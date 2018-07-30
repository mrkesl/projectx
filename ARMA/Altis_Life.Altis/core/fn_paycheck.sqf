#include <macro.h>

__CONST__(life_paycheck_period,10); //Ten minutes
switch (playerSide) do
{
	case west:
	{
		if((player getvariable["bankacc",0]) == 0) then {
			player setvariable["cash", 50000, true]; //Starting Bank Money
		};
		life_paycheck = 15000; //Paycheck Amount
	};
	case civilian:
	{
		if((player getvariable["bankacc",0]) == 0) then {
			player setvariable["cash", 15000, true]; //Starting Bank Money
		};
		life_paycheck = 1500; //Paycheck Amount
	};

	case independent:
	{
		if((player getvariable["bankacc",0]) == 0) then {
			player setvariable["cash", 100000, true]; //Starting Bank Money
		};
		life_paycheck = 10000;
	};
};
life_paycheck_aac = 12000; //Paycheck Amount aac
life_paycheck_aac_free = 2000; //Paycheck Amount Freetime
__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
__CONST__(life_paycheck_aac,life_paycheck_aac); //Make the paycheck static.
__CONST__(life_paycheck_aac_free,life_paycheck_aac_free); //Make the paycheck static.

true spawn {
	private["_time","_paycheck"];

	systemChat format[localize "STR_FSM_Paycheck",(call life_paycheck_period)];

	while {true} do {
		_time = time + ((call life_paycheck_period) * 60);
		waitUntil {time > _time};
		_paycheck = life_paycheck;
		if(!alive player) then {
			systemChat localize "STR_FSM_MissedPay";
		} else {
			if(player distance (getMarkerPos "fed_reserve") < 120 && playerSide == west) then {
				systemChat format[localize "STR_FSM_ReceivedPay",[(call _paycheck) + 1500] call life_fnc_numberText];
				player setvariable["bankacc", (player getvariable["bankacc",0]) + (call _paycheck) + 1500, true];
			} else {
				_paycheck = life_paycheck;
				if ((player getvariable["onDuty", false]) && ((player getVariable ["aac_level", 0]) > 0)) then {
					_paycheck = life_paycheck_aac;
				} else {
					if (!(player getvariable["onDuty", false]) && ((player getVariable ["aac_level", 0]) > 0)) then {
						_paycheck = life_paycheck_aac_free;
					};
				};
				player setvariable["bankacc", (player getvariable["bankacc",0]) + (call _paycheck), true];
				systemChat format[localize "STR_FSM_ReceivedPay",[(call _paycheck)] call life_fnc_numberText];
			};
		};
		{
			if(local _x && {(count units _x == 0)}) then {
				deleteGroup _x;
			};
		} foreach allGroups;
	};
};
