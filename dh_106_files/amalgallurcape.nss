int StartingConditional()
{
object oPC = GetPCSpeaker();
object oItem = GetFirstItemInInventory(oPC);
while(GetIsObjectValid(oItem))
    {
    if((GetStringLeft(GetTag(oItem), 12) == "set_cha_cape") && GetStringRight(GetTag(oItem), 3) != "002")
        {
        return TRUE;
        }
    oItem = GetNextItemInInventory(oPC);
    }
return FALSE;
}
