int StartingConditional()
{
object oPC = GetPCSpeaker();
if(GetItemPossessedBy(oPC, "set_wis_helm") != OBJECT_INVALID)
    {
    return TRUE;
    }
return FALSE;
}
