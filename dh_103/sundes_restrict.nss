//::///////////////////////////////////////////////
//:: FileName sundes_restrict
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/9/2007 3:44:49 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "Signet"))
		return FALSE;

	return TRUE;
}
