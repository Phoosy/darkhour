////This script Store the LOGIN name of the Targeted Player ( targeted by the Admin rod)
//// on a table in teh BATADASE  AS Winged GOD   /////////////
#include "aps_include"
#include "inc_bs_module"
#include "aw_include"
void main()
{
    object oPC = GetPCSpeaker();
    object oTarget=GetLocalObject(oPC, "oMyTarget");

    if (!GetIsAdmin(oPC))
    {
        FloatingTextStringOnCreature("You can't use this Power!",oPC,FALSE);
        return;
    }

    string sLogin = GetPCPublicCDKey(oTarget)+GetPCPlayerName(oTarget);
    SetModuleVar("WingedGod_"+sLogin,IntToString(0),0,"AdminsGmsGods");
    FloatingTextStringOnCreature("<c.͎>"+GetPCPlayerName(oTarget)+" Login was removed ( set to 0) from WingedGod [DB Table:AdminsGmsGods].</c>",oPC,FALSE);

    DelayCommand(03.0,DeleteLocalObject(oPC, "oMyTarget"));


    if (!GetIsWingedGod(oTarget))
    {
        FloatingTextStringOnCreature("<c�7�>"+sLogin+" Removed Successfully.</c>",oPC,FALSE);
    }
}
