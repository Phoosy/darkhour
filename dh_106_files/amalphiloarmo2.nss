void DelayedCreateItemOnObject(string sResref, object oTarget, int nStacksize)
{
    CreateItemOnObject(sResref, oTarget, nStacksize);
}
void main()
{
object oPC = GetPCSpeaker();
int iGold = GetGold(oPC);
int iOrbs = GetItemStackSize(GetItemPossessedBy(oPC, "orbofphilo"));
int iQuit = 0;
if(iGold < 1500)
    {
    SendMessageToPC(oPC, "You do not have enough gold to complete this operation.");
    iQuit = 1;
    }
if(iOrbs < 2)
    {
    SendMessageToPC(oPC, "You do not have enough orbs of philosopher to complete this operation.");
    iQuit = 1;
    }
if(GetItemPossessedBy(oPC, "set_wis_armor001") == OBJECT_INVALID)
    {
    SendMessageToPC(oPC, "You do not possess the necessary piece of equipment.");
    iQuit = 1;
    }
if(iQuit != 0)
    {
    return;
    }
TakeGoldFromCreature(1500, oPC, TRUE);
DestroyObject(GetItemPossessedBy(oPC, "set_wis_armor001"));
if(iOrbs > 2)
    {
    int iStack = iOrbs - 2;
    DelayCommand(0.3, DestroyObject(GetItemPossessedBy(oPC, "orbofphilo")));
    DelayCommand(0.5, DelayedCreateItemOnObject("orbofphilo", oPC, iStack));
    }else
        {
        DestroyObject(GetItemPossessedBy(oPC, "orbofphilo"));
        }
object oCreate = CreateItemOnObject("set_wis_armor002", oPC);
SendMessageToPC(oPC, "A(n) " + GetName(oCreate) + " has been successfully amalgamated!");
}
