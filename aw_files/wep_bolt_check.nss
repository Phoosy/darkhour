int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(),"BoltMaker") != OBJECT_INVALID)
    {
        return TRUE;
        SetLocalInt(GetPCSpeaker(),"nFoundMaker", 1);
    }
    else return FALSE;
}