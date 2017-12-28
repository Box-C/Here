/**
    Copyright Â© 2017 ANZUSGaming
    All Rights Reserved.

    Description:
    Add action fuel action in Station Service.

    put function in init file then execute it with:
    call getFuelpumps;
    getFuelpumps =
    {
        _pos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
        _Station = nearestobjects [_pos,["Land_fs_feed_F","Land_FuelStation_Feed_F"], 25000];
        _br = toString [13, 10];
        _tab = toString [9];

        _TexteSortie = "_NiiRoZz_Station_Essence = [" + _br;

        {
            _Array = [getpos _x];
            _TexteSortie = _TexteSortie + _tab + (str _Array);
            _TexteSortie = if (_forEachIndex < ((count _Station) - 1)) then {_TexteSortie + ", " + _br} else {_TexteSortie + _br};
        } forEach _Station;
        _TexteSortie = _TexteSortie + "];";
        hint "Completed";
        copyToClipboard _TexteSortie;
    };
*/
private _maldenPositions = [
    [5507.06,3498.76,-0.0244446],
    [5505.3,3499.18,-0.029213],
    [5503.41,3499.63,-0.0339737],
    [8041.43,4027.86,-0.0129128],
    [8046.69,4023.45,-0.0129128],
    [8046.92,4034.63,-0.0129128],
    [8052.17,4030.21,-0.0129128],
    [8052.32,4041.59,-0.0129128],
    [8057.57,4037.17,-0.0129128],
    [7046.78,7050.48,-0.14489],
    [7046.75,7052.38,-0.166283],
    [7046.78,7054.36,-0.190231],
    [3230.32,6289.84,-0.118713],
    [3228.68,6290.45,-0.118118],
    [3226.7,6291.02,-0.119003],
    [7219.06,7769.21,-0.0842285],
    [7224.13,7772.29,-0.0842438],
    [7214.63,7776.75,-0.0842438],
    [7219.71,7779.83,-0.0842438],
    [6633.08,8806.81,-0.0259476],
    [5111.19,9061.96,-0.105164]
];

private _tanoaPositions = [
    [7978.23,7419.24,-0.100807],
    [7976.92,7427.11,-0.058516],
    [5173.94,8806.35,-0.0822775],
    [8318.9,9708.81,-0.0886936],
    [8320.71,9712.02,-0.0936089],
    [5388.58,4090.7,-0.0951052],
    [5379.5,4092.98,-0.0942526],
    [10826.8,6489.7,-0.082561],
    [8970.37,10332.2,-0.0989342],
    [11146.1,5152,-0.0805874],
    [11154,5152.43,-0.0809298],
    [10935.1,9856.06,-0.129646],
    [10940.8,9855.39,-0.122383],
    [2462.99,7430.69,-0.0870638],
    [2451.51,7434.7,-0.0931244],
    [8494.36,12431.9,-0.110229],
    [8493.01,12437.9,-0.106827],
    [8492.14,12441.6,-0.0828552],
    [5594.15,12508.2,-0.0947819],
    [11631,2998.85,-0.0782437],
    [11642,2990.83,-0.0782394],
    [3029.45,11316.1,-0.0828028],
    [2137.26,3360.77,-0.0583258],
    [2132.29,3360.43,-0.0607367],
    [8952.38,13678,-0.0624466],
    [8954.36,13678,-0.0624466],
    [8956.19,13677.8,-0.0624466],
    [14364.7,8743.01,-0.0650101],
    [14260.9,11513,-0.114521],
    [14264.8,11508.9,-0.108963],
    [6886.99,7490.55,0],
    [7366.7,7995.42,-0.212462],
    [7358.5,7998.4,-0.190624],
    [7369.15,8002.09,-0.129763],
    [7360.96,8005.08,-0.171917],
    [5771.25,4239.42,-0.205085],
    [5776.41,4232.31,-0.232585],
    [5767.14,4236.94,-0.182347],
    [5781.14,4224.93,-0.229755],
    [5771.14,4229.01,-0.235736],
    [5775.74,4221.55,-0.232986],
    [5409.42,9905.04,0.00515461],
    [5403.54,9905.04,0.00549698],
    [5409.69,9913.75,0.00508261],
    [5403.81,9913.74,0.00502348],
    [5681.72,10164.6,-0.0340471],
    [5685.9,10173,-0.0219851],
    [5677.78,10173.8,-0.0185199],
    [5683.21,10182,-0.0282073],
    [5810.65,10816.9,0.0893035],
    [5801.93,10816.8,0.0450912],
    [5793.12,10817,0.0373325],
    [5810.71,10825.1,0.0521221],
    [5801.99,10825,0.039825],
    [5793.18,10825.1,0.0337515],
    [12613.3,7582.82,-0.264584],
    [12618.1,7580.01,-0.330997],
    [12617.5,7590.52,-0.225117],
    [12622.3,7587.7,-0.245724],
    [6600.12,13076.3,-0.249989],
    [6592,13079.6,-0.231892],
    [6602.45,13082,-0.230906],
    [6583.86,13082.9,-0.230913],
    [6594.32,13085.3,-0.230906],
    [6586.18,13088.6,-0.230906],
    [11686.6,2267.25,-0.208622],
    [11694.3,2271.39,-0.203085],
    [11689.9,2260.98,-0.205484],
    [11697.6,2265.13,-0.199961],
    [9953.85,13467,-0.23254],
    [9960.31,13466.6,-0.23254],
    [9954.45,13475.7,-0.23254],
    [9960.92,13475.4,-0.23254],
    [9954.69,13484.5,-0.23254],
    [9961.15,13484.2,-0.23254],
    [1873.69,12121.5,-0.248567],
    [1874.1,12127.6,-0.203133],
    [1864.93,12122,-0.331924],
    [1865.37,12128,-0.236609],
    [11618.7,13053,-0.255869],
    [11627,13050.4,-0.237558],
    [11635.3,13047.4,-0.229898],
    [11620.6,13058.4,-0.237006],
    [11629,13055.8,-0.232919],
    [11637.2,13052.8,-0.228891]
];

private _stationPositions = [[["Malden", _maldenPositions], ["Tanoa", _tanoaPositions]]] call TON_fnc_terrainSort;
diag_log ("::TESTING - _stationPositions::" + str _stationPositions);
{
    private _pump = nearestObjects [_x,["Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_01_pump_malevil_F"],5] select 0;
    _pump setFuelCargo 0;
    _pump addAction [localize "STR_Action_Pump", life_fnc_fuelStatOpen, 1, 3, true, true, "", '_this distance _target < 5 && cursorObject isEqualTo _target'];
    false
} count _stationPositions;