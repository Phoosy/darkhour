int StartingConditional()
{
object oPC = GetPCSpeaker();

if((GetLocalInt(oPC, "langamount") > 0) && GetItemPossessedBy(oPC, "hlslang_6") == OBJECT_INVALID) return TRUE;

return FALSE;
}
