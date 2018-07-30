params [["_object", ObjNull, [ObjNull]], ["_index", 0, [0]], ["_texture", "", [""]]];

if(isNull _object OR _texture == "") exitWith {};
_object setObjectTexture[_index,_texture];