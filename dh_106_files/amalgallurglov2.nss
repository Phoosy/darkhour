int StartingConditional()
{
object oPC = GetPCSpeaker();
if(GetItemPossessedBy(oPC, "set_cha_gloves001") != OBJECT_INVALID)
    {
    return TRUE;
    }
return FALSE;
}
