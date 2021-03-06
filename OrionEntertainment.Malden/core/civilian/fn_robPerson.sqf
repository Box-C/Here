#include "..\..\script_macros.hpp"
/*
    File: fn_robPerson.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Robs a person.
*/
params [
    ["_robber",objNull,[objNull]]
];
if (isNull _robber) exitWith {}; //No one to return it to?

if (getInVehicles > 0) then {
    [getInVehicles,player,_robber] remoteExecCall ["life_fnc_robReceive",_robber];

    if (life_HC_isActive) then {
        [getPlayerUID _robber,_robber getVariable ["realname",name _robber],"222"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
    } else {
        [getPlayerUID _robber,_robber getVariable ["realname",name _robber],"222"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    };

    [1,"STR_NOTF_Robbed",true,[_robber getVariable ["realname",name _robber],profileName,[getInVehicles] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
    getInVehicles = 0;
    [0] call SOCK_fnc_updatePartial;
} else {
    [2,"STR_NOTF_RobFail",true,[profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};
