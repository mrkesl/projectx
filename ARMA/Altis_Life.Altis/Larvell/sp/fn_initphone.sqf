/*
File: fn_initphone.sqf
Author: Larvell
Date: 08.08.2015

Description:
- check if "itemradio" exists
- run the extended sql based smartphone
- included exception for admins to ensure they can write anybody
*/
if((player getVariable ["admin_level", 0]) > 1) exitWith {createDialog "life_ext_messenger";};
if("ItemRadio" in assignedItems player) then {
createDialog "life_ext_messenger";
//createDialog "Life_my_smartphone";
}else{
hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Kein Handy</t><br/><br/>
<t size='0.90 'font='puristaLight' align='left'>Du musst ein Handy haben, um diese Funktion nutzen zu können!</t><br/>"];
};
