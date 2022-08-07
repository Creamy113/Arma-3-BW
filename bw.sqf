_timer = 300;
_c = 0;
bwBlown = 0;

if (side player == WEST) then {
  hint "THE BW is being robbed, go stop them!";
};


if (bwBlown == 0) then {
    if (side player == WEST) then {
    defuseAction = bwDome addAction ["Dufuse Bomb", {
            _timer1 = 10;
            _c1 = 0;
            while {_c1 == 0} do {
              _timer1 = _timer1 - 1;
              sleep 1;
              if (_timer1 == 0) then {
                _c1 = 1;
                hint "The Bomb has been diffused!";
                bwProgess = 0;
                bwDome removeAction defuseAction;
              };
              if (alive player == false) then {
                _c1 = 1;
              };
            };
        }];
      };
    };


while {_c == 0} do
{
  if (bwProgess == 0) exitWith {
    _c = 1;
  };

  _timer = _timer - 1;
  sleep 1;
  hint format ["%1", _timer];

  if (_timer == 0) then
  {
    bwDome removeAction defuseAction;
    bwBlown = 1;
    _c = 1;
    hint format ["The Bomb has Blown!"];
    bwDome setVariable ['BIS_Disabled_Door_1',0,true];
    bwCrate lockInventory false;
    _rarity = [1, 100] call BIS_fnc_randomInt;

// 1 - 10 or 10% = rare spawn
// 10 - 40 or 30% = uncommon spawn
// 40 - 100 or 60% = common spawn

      if (_rarity <= 10) then {
          _r0 = [1, 3] call BIS_fnc_randomInt;
          if (_r0 == 1) then {
          createVehicle ["B_Heli_Transport_01_F", bwSpawn, [], 0, "CAN_COLLIDE"];
          };
          if (_r0 == 2) then {
          createVehicle ["I_G_Offroad_01_AT_F", bwSpawn, [], 0, "CAN_COLLIDE"];
          };
          if (_r0 == 3) then {
          createVehicle ["B_Heli_Transport_03_black_F", bwSpawn, [], 0, "CAN_COLLIDE"];
          };
      } else {
        if (_rarity <= 40) then {
          createVehicle ["B_T_LSV_01_armed_F", bwSpawn, [], 0, "CAN_COLLIDE"];
        } else {
          if (_rarity <= 100) then {
            _r1 = [1, 3] call BIS_fnc_randomInt;
            if (_r1 == 1) then {
            createVehicle ["O_LSV_02_armed_F", bwSpawn, [], 0, "CAN_COLLIDE"];
            };
            if (_r1 == 2) then {
            createVehicle ["I_C_Offroad_02_AT_F", bwSpawn, [], 0, "CAN_COLLIDE"];
            };
            if (_r1 == 3) then {
            createVehicle ["I_C_Offroad_02_unarmed_F", bwSpawn, [], 0, "CAN_COLLIDE"];
            };
          };
        };
      };

    _commonWeapons = ["LMG_Mk200_F","arifle_Mk20_F","arifle_MX_SW_F","arifle_MXM_F","arifle_TRG20_F"];
    _uncommonWeapons = ["launch_Titan_F","srifle_DMR_03_F","arifle_AK12_F","arifle_MSBS65_UBS_black_F","srifle_EBR_F"];
    _rareWeapons = ["srifle_GM6_SOS_F","srifle_DMR_02_camo_F","srifle_DMR_04_F"];
    _armor = ["U_B_HeliPilotCoveralls","U_B_PilotCoveralls","H_PilotHelmetFighter_B","V_PlateCarrierSpec_rgr"];
    _misc = ["optic_DMS","APERSMine_Range_Mag","APERSTripMine_Wire_Mag"];

    _common = 0;
    _cloot = 0;
    _uncommon = 0;
    _uncloot = 0;
    _rare = 0;
    _rloot = 0;
    _a = 0;
    _aloot = 0;
    _m = 0;
    _mloot = 0;

    while {_cloot == 0} do
    {
      _common = _common + 1;
      bwCrate addWeaponCargo [selectRandom _commonWeapons, 1];
      if (_common == 8) then {_cloot = 1;};
    };
    while {_uncloot == 0} do
    {
      _uncommon = _uncommon + 1;
      bwCrate addWeaponCargo [selectRandom _uncommonWeapons, 1];
      if (_uncommon == 4) then {_uncloot = 1;};
    };
    while {_rloot == 0} do
    {
      _rare = _rare + 1;
      bwCrate addWeaponCargo [selectRandom _rareWeapons, 1];
      if (_rare == 2) then {_rloot = 1;};
    };
    while {_aloot == 0} do
    {
      _a = _a + 1;
      bwCrate addItemCargo [selectRandom _armor, 1];
      if (_a == 4) then {_aloot = 1;};
    };
    while {_mloot == 0} do
    {
      _m = _m + 1;
      bwCrate addItemCargo [selectRandom _misc, 1];
      if (_m == 1) then {_mloot = 1;};
    };

// This will spawn 8 common weapons, 4 uncommon weapons, 2 rare weapons, 4 armor pieces and 1 misc item
// This is great for stopping the constant spam of addWeaponCargo for 19 lines etc

   execVM "repair.sqf";
 };
};
