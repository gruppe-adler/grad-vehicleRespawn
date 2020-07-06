params ["_vehType", "_respawnWhenNotDead", "_vehDir", "_vehPos", "_handle", "_customCode"];

if ( _veh distance _vehPos > (sizeOf _vehType)) exitWith { diag_log format ["too close to original position"]; };

private _positionEmpty = nearestObjects [_vehPos, ["Man", "LandVehicle", "Air"], (sizeOf _vehType)/2]; // (_vehPos findEmptyPosition [0,0,_vehType]);

diag_log format ["vehicle %1 _positionEmpty for %2", _positionEmpty, _vehType];
private _isRoom = count _positionEmpty isEqualTo 0;

// if position is empty
if (_isRoom) then {
    diag_log format ["there is room, removing handle", _positionEmpty];

    [_handle] call CBA_fnc_removePerFrameHandler;
    [_vehType, _respawnWhenNotDead, _vehPos, _vehDir, _customCode] call GRAD_simpleVehicleRespawn_fnc_spawn;
};
