void main()
{
object oPC = GetLastUsedBy();
object oDestination = GetObjectByTag("TSTPortal2");
location lLocation = GetLocation(oDestination);
AssignCommand(oPC, JumpToLocation(lLocation));
}
