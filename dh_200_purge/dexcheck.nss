//::///////////////////////////////////////////////
//:: FileName dexcheck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/20/2007 7:41:44 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
	if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_DEXTERITY) > 15))
		return FALSE;

	return TRUE;
}
