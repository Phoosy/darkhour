////This script Store the LOGIN name of the Targeted Player (targeted by the Admin rod)
//// on a table in teh BATADASE  ASADMIN   /////////////
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
    SetModuleVar("Admin_"+sLogin,"1",0,"AdminsGmsGods");
    FloatingTextStringOnCreature("<c.͎>"+GetPCPlayerName(oTarget)+" Login is stored as Admin [DB Table:AdminsGmsGods].</c>",oPC,FALSE);

    DelayCommand(03.0,DeleteLocalObject(oPC, "oMyTarget"));

    if ( GetModuleVar("Admin_"+sLogin,"AdminsGmsGods") ==  "1" )
    {
        FloatingTextStringOnCreature("<c�7�>"+sLogin+" Information stored Successfully.</c>",oPC,FALSE);
    }
    if (GetIsAdmin(oTarget))
    {
        FloatingTextStringOnCreature("<c�7�>"+sLogin+" Verified Successfully.</c>",oPC,FALSE);
    }
}
