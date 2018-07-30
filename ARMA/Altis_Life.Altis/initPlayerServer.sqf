//  http://www.altisliferpg.com/topic/3437-howto-advanced-death-messages/

_this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDunnit}];