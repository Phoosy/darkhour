int StartingConditional()
{
object oPC = GetPCSpeaker();
if(GetItemPossessedBy(oPC, "set_str_cape") != OBJECT_INVALID)
    {
    return TRUE;
    }
return FALSE;
}
