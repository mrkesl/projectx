/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if((player getvariable["cash",0]) < 500) then
{
	if((player getvariable["bankacc",0]) < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "Du hast keine $500 in Bar oder auf deinem Konto!"};
	case 1: {vehicle player setDamage 0; player setvariable["cash", (player getvariable["cash",0]) - 500, true]; hint "Du hast dein Fahrzeug für $500 repariert";};
	case 2: {vehicle player setDamage 0; player setvariable["bankacc", (player getvariable["bankacc",0]) - 500, true]; hint "Du hast dein Fahrzeug für $500 repariert";};
};