#include "..\..\script_macros.hpp"
/*
    File: fn_buyHouseGarage.sqf
    Author: BoGuu
    Description:
    Buy functionality for house garages.
*/

private _house = param [0,objNull,[objNull]];
private _uid = getPlayerUID player;

if (isNull _house) exitWith {};
if (_house getVariable ["garageBought",false]) exitWith {[localize "STR_Garage_alreadyOwned",true,"slow"] call life_fnc_notificationSystem;};
if ((_house getVariable "house_owner") select 0 != getPlayerUID player) exitWith {[localize "STR_Garage_NotOwner",true,"slow"] call life_fnc_notificationSystem;};
if (_house getVariable ["blacklistedGarage",false]) exitWith {};
closeDialog 0;

private _price = LIFE_SETTINGS(getNumber,"houseGarage_buyPrice");

_action = [
    format [localize "STR_Garage_HouseBuyMSG",_price],
    localize "STR_House_GaragePurchase",
    localize "STR_Global_Buy",
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {

    if (getOutVehicle < _price) exitWith {hint format [localize "STR_House_NotEnough"]};
    getOutVehicle = getOutVehicle - _price;
    [1] call SOCK_fnc_updatePartial;

    if (life_HC_isActive) then {
        [_uid,_house,0] remoteExec ["HC_fnc_houseGarage",HC_Life];
    } else {
        [_uid,_house,0] remoteExec ["TON_fnc_houseGarage",RSERV];
    };

    _house setVariable ["garageBought",true,true];

};