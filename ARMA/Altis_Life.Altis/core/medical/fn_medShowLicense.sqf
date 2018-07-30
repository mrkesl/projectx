private["_target", "_message","_mediclevel","_rang"];
_target = cursorTarget;

if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};


_mediclevel = (player getVariable ["medic_level", 0]);
diag_log str _mediclevel;


switch ( _mediclevel ) do
{
        case 1: { _rang = "Sanitäter"; };
        case 2: { _rang = "Arzt"; };
        case 3: { _rang = "Chefarzt"; };
        default { _rang =  "Error";};
};


_message = format["<img size='10' color='#FFFFFF' image='textures\medausweis.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Libra Arzt</t>", name player, _rang];


[player, _message] remoteExec ["life_fnc_medLicenseShown", _target, false];
