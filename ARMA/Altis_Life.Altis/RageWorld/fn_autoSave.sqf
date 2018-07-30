/*
@Version: 0.3
@Author: =IFD= Cryptonat
@Edited: 5/16/14
Edit: Creedcoder
Description:
Saves the player's gear every 10 minutes.
*/

while {true} do {
  sleep 600;
  [] spawn REDIS_fnc_save;
  hint "Spiel wurde gespeichert"
};
