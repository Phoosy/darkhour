void main()
      {
        object oPC=GetFirstPC();
            while (GetIsObjectValid(oPC))
                {
                FloatingTextStringOnCreature("7 Minutes before server restart...",oPC,FALSE);

                oPC = GetNextPC();
                }

       }
