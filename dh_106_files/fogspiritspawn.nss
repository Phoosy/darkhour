void main()
{
object oPC = GetEnteringObject();
if(GetIsPC(oPC) == FALSE)
    {
    return;
    }
int iLevel = GetLevelByPosition(1, oPC) + GetLevelByPosition(2, oPC) + GetLevelByPosition(3, oPC);
int iSpawn = GetLocalInt(OBJECT_SELF, "canspawn");
location lLoc = GetLocation(GetNearestObjectByTag("spawnhere", OBJECT_SELF));
location lLocTwo = GetLocation(GetNearestObjectByTag("spawnhere2", OBJECT_SELF));
if(iSpawn != 0)
    {
    return;
    }
if(iLevel == 1)
    {
    CreateObject(OBJECT_TYPE_CREATURE, "lesserfogspirit", lLoc, TRUE);
    SetLocalInt(OBJECT_SELF, "canspawn", 1);
    DelayCommand(300.0, SetLocalInt(OBJECT_SELF, "canspawn", 0));
    return;
    }
else if(iLevel == 2)
    {
    CreateObject(OBJECT_TYPE_CREATURE, "lesserfogspirit", lLoc, TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, "lesserfogspirit", lLocTwo, TRUE);
    SetLocalInt(OBJECT_SELF, "canspawn", 1);
    DelayCommand(300.0, SetLocalInt(OBJECT_SELF, "canspawn", 0));
    return;
    }
else if(iLevel == 3)
    {
    CreateObject(OBJECT_TYPE_CREATURE, "greatfogspirit", lLoc, TRUE);
    SetLocalInt(OBJECT_SELF, "canspawn", 1);
    DelayCommand(300.0, SetLocalInt(OBJECT_SELF, "canspawn", 0));
    return;
    }
else if(iLevel > 3)
    {
    CreateObject(OBJECT_TYPE_CREATURE, "greatfogspirit", lLoc, TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, "greatfogspirit", lLocTwo, TRUE);
    SetLocalInt(OBJECT_SELF, "canspawn", 1);
    DelayCommand(300.0, SetLocalInt(OBJECT_SELF, "canspawn", 0));
    return;
    }
}
