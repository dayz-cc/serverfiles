activateAddons [ 
  "rmod"
];

activateAddons ["rmod"];
initAmbientLife;

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_unit_0 = objNull;
if (true) then
{
  _this = _group_0 createUnit ["US_Soldier_AA_EP1", [6987.5156, 7540.5449, -286.20276], [], 0, "CAN_COLLIDE"];
  _unit_0 = _this;
  _this setUnitAbility 0.60000002;
  if (true) then {_group_0 selectLeader _this;};
  if (true) then {selectPlayer _this;};
};

_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["CSJ_GyroP", [5247.2231, 2233.3645, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setDir -92.319382;
  _this setPos [5247.2231, 2233.3645, 2.8610229e-006];
};

_vehicle_1 = objNull;
if (true) then
{
  _this = createVehicle ["CSJ_GyroCover", [4079.4302, 10727.671,0], [], 0, "CAN_COLLIDE"];
  _vehicle_1 = _this;
  _this setPos [4079.4302, 10727.671];
};

_vehicle_2 = objNull;
if (true) then
{
  _this = createVehicle ["CSJ_GyroP", [11809.768, 12845.688, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setPos [11809.768, 12845.688, -3.0517578e-005];
};

processInitCommands;
runInitScript;
finishMissionInit;
