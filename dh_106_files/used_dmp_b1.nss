void main()
{
object oPC = GetLastUsedBy();
location lLoc = GetLocation(GetObjectByTag("DHDM_B_2"));
AssignCommand(oPC, JumpToLocation(lLoc));
}
