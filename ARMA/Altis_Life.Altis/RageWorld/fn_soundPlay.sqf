/*
this plays a sound
by Ragebone
t = time of the sound
_oft = how often we want it to play.
*/

private["_so","_obj","_t","_oft"];
_so = _this select 1;
_obj = _this select 0;
if (isNil{_this select 2})then{
	_obj  say3D  _so;
}else {
	if !(isNil{_this select 3})then{
		_t = _this select 2;
		_oft = this select 3;
		{		
			_obj say3D  _so;
			sleep _t;
			//_oft = _oft - 1;
		}forEach _oft;	
	};	
};


