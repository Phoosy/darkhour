int StartingConditional()
{
object oPC = GetPCSpeaker();
if(GetItemPossessedBy(oPC, "set_str_ring001") != OBJECT_INVALID)
    {
    return TRUE;
    }
return FALSE;
}
