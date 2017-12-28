/*
    File: MoneyCheck.sqf
    Author: Flabby "http://steamcommunity.com/id/FlabbyButt/"

    Description:
    Check if player has gotten over 5 mill in the past 15 secs
*/
#include "..\..\script_macros.hpp"
if (isServer) exitWith{};
private["_money","_bank","_money2","_bank2"];
while {true} do
{
	_money = getInVehicles;
	_bank = getOutVehicle;
	_money2 = life_pulloutallplayers;
	_bank2 = life_getinvehicle;
	sleep 15;
	if (getInVehicles > (_money + 5000000)) then {
		player setVariable ["Hacking +5 Mill in 15 Secs",true];
	};
	if (getOutVehicle > (_bank + 5000000)) then {
		player setVariable ["Hacking +5 Mill in 15 Secs",true];
	};
	if (life_pulloutallplayers > (_money2 + 5000000)) then {
		player setVariable ["Hacking +5 Mill in 15 Secs",true];
	};
	if (life_getinvehicle > (_bank2 + 5000000)) then {
		player setVariable ["Hacking +5 Mill in 15 Secs",true];
	};
};