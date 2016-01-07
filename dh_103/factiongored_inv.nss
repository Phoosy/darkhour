//::///////////////////////////////////////////////
//:: FileName factiongored_inv
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/19/2007 6:17:21 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "professionkguard"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "professionsguard"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "professionsknight"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "professionmerchant"))
        return FALSE;

    return TRUE;
}
