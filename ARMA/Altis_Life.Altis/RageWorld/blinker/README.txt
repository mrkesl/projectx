Project: Indecatorsystem
author: Ragebone
WORK IN PROGRESS!

Idear was developed in my time at Nope-Gaming.de where i have build a much more
complicated version of this 
0.9 is more ore less as easy and slim as I could make it. But im kind of a noob... 
This was developed in Taw Tonics Altis Life enviromente. 
Would apreceate feedback on what to improve and who is using it.
I will implement every cool feature you will tell me :D

List of Servers:
currently empty.

Unfinished:

Coordinates of indecatorlights for every vehicle. Pls shout your changes out that this gets better for everyone of us!
Modifying the light effects, it could look a bit gross right now, 
havent seen it for a while and last thin i did was playing around with the lightening stuff ....
>.<

Future:
adjustments: possably moving the surounding light away from the vehicle that most of the surrounding stuff is lighted up but not the car itself.
Sounds: If you have sounds, pm we! ill put em in :D im to lazy to search for them.
Fancy icons?
car batery ? 
Hints?
A better world? 


Implementation:

RageWorld as a standalone Folder organisation thing, because I will release some other cool things
in the near future, wich should be organised seperatly to make it easy to maintain.

You need a Eventhandler on Keydown, like there is one in Altis Life. and you also need a function management
like the functions.h in Altis Life.

Keyhandler:
	
	_blinkerLinks = if(count (actionKeys "User2") == 0) then {16} else {(actionKeys "User2") select 0};	
	case _blinkerLinks:{ // Q
		if(_shift && alive _veh && _veh != player && ((driver _veh) == player) ) then {
			[_veh,"left"] call life_fnc_BlinkerInit;					
		};			
	};		
	_blinkerRechts = if(count (actionKeys "User1") == 0) then {18} else {(actionKeys "User1") select 0};
	case _blinkerRechts:{ // E
		if(_shift && alive _veh && _veh != player && ((driver _veh) == player) ) then{
			[_veh,"right"] call life_fnc_BlinkerInit;			
		};
	};	
	_blinkerWarn = if(count (actionKeys "User3") == 0) then {15} else {(actionKeys "User3") select 0};
	case _blinkerWarn:{ // Tab
		if(alive _veh && _veh != player && ((driver _veh) == player) ) then{
			[_veh,"warning"] call life_fnc_BlinkerInit;			
		};
	};	
	
	
Functions.h:	

	class RageWorld_blinker
	{
		file = "RageWorld\indicators";
		class BlinkerInit {};
		class BlinkerLinks {};
		class BlinkerRechts {};
		class WarnBlinker {};
	};	