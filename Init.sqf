// This is the BlackWater script that I made. I have put in
// everything I could think of when it came to exceptions/spawns etc


bwProgess = 0;
bwCrate lockInventory true;
bwDome setVariable ['BIS_Disabled_Door_1',1,true];


bwDome addAction ["Start Blackwater Robbery", { if (bwProgess == 0) then
  {
    if (side player != WEST) then {
      if (playersNumber WEST == 7) then {
       execVM "bw.sqf";
       bwProgess = 1;
       cutText ["***THE BLACKWATER ARMORY IS BEING ROBBED***", "PLAIN", -1, true];
      } else {hint "There are not enough cops on the start the Blackwater Robbery!"};
    } else {hint "You are a cop dont do that!"};
  } else {hint "The Blackwater Robbery is already in progress!"};
  }];
