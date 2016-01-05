void main()
{
    object oPC = GetEnteringObject();

    if(GetItemPossessedBy(oPC, "professionbaker") == OBJECT_INVALID && 
       GetItemPossessedBy(oPC, "professioncook") == OBJECT_INVALID && 
       GetIsPC(oPC))
    {
        CreateItemOnObject("professionbaker", oPC);
        SendMessageToPC(oPC, "Newbies proceed up the pathway ahead!");
    }

    if(GetItemPossessedBy(oPC, "DyeKit") != OBJECT_INVALID)
        SetPlotFlag(GetItemPossessedBy(oPC, "DyeKit"), TRUE);
    
    if(GetSkillRank(SKILL_HEAL, oPC, FALSE) >= 10 && 
       GetItemPossessedBy(oPC, "ressurecttool") == OBJECT_INVALID)
    {
        CreateItemOnObject("ressurecttool", oPC);
        SendMessageToPC(oPC, "Your heal skill is high enough to use the new healing tool. Please read its description");
    }
}
