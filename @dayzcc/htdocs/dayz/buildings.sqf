activateAddons [
];

activateAddons [];
initAmbientLife;

_this = createCenter west;
_center_0 = _this;

_this = createCenter west;
_center_1 = _this;

_group_0 = createGroup _center_1;

_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Mil_Barracks", [10317.078, 2605.187, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setPos [10317.078, 2605.187, -3.6239624e-005];
};

_vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Mil_Barracks_i", [10335.747, 2586.3525, -2.8610229e-006], [], 0, "CAN_COLLIDE"];
  _vehicle_9 = _this;
  _this setPos [10335.747, 2586.3525, -2.8610229e-006];
};

_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Mil_Barracks_L", [10319.699, 2570.7449, 1.0490417e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  _this setPos [10319.699, 2570.7449, 1.0490417e-005];
};

_unit_12 = objNull;
if (true) then
{
  _this = _group_0 createUnit ["DZ_Pastor", [10294.332, 2588.7913, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
  _unit_12 = _this;
  _this setUnitAbility 0.60000002;
  if (true) then {_group_0 selectLeader _this;};
  if (true) then {selectPlayer _this;};
};

_unit_13 = objNull;
if (true) then
{
  _this = _group_0 createUnit ["DZ_Pastor", [10376.269, 2866.3796, 0.014457703], [], 0, "CAN_COLLIDE"];
  _unit_13 = _this;
  _this setUnitAbility 0.60000002;
  if (false) then {_group_0 selectLeader _this;};
};

processInitCommands;
runInitScript;
finishMissionInit;
