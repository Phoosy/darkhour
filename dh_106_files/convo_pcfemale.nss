//::///////////////////////////////////////////////
//:: FileName convo_pcfemale
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/31/2007 2:56:13 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Add the gender restrictions
	if(GetGender(GetPCSpeaker()) != GENDER_FEMALE)
		return FALSE;

	return TRUE;
}