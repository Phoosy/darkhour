void main()
{
    object oPC = GetLastUsedBy();
    object oDestination = GetWaypointByTag("SmithyHomeWP1");
    location lLocation = GetLocation(oDestination);
    AssignCommand(oPC, JumpToLocation(lLocation));
}
