dR = 0;
dC = 0;

if (bwBlown == 1) then {
    if (side player == WEST) then
    {
    repairDomeAction = bwDome addAction ["Repair Dome",
      {
        _timer2 = 10;
        _c2 = 0;
        while {_c2 == 0} do {
          _timer2 = _timer2 - 1;
          sleep 1;
          if (_timer2 == 0) then {
            _c2 = 1;
            hint "The Dome has been Repaired!";
            bwDome setVariable ['BIS_Disabled_Door_1',1,true];
            bwDome removeAction repairDomeAction;
            dR = 1;
          };
          if (alive player == false) then {
            _c2 = 1;
          };
        };
      }];

    repairCrateAction = bwCrate addAction ["Repair Crates",
      {
        _timer3 = 10;
        _c3 = 0;
        while {_c3 == 0} do {
          _timer3 = _timer3 - 1;
          sleep 1;
          if (_timer3 == 0) then {
            _c3 = 1;
            hint "The Crate has been Repaired!";
            bwCrate lockInventory true;
            bwCrate removeAction repairCrateAction;
            dC = 1;
          };
          if (alive player == false) then {
            _c3 = 1;
          };
      };
    }];
  };
  waitUntil {dR == 1};
  waitUntil {dC == 1};
  bwProgess = 0;
};
