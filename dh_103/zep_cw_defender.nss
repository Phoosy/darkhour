//::///////////////////////////////////////////////
//:: CEP Creature Wizard
//:: Community Expansion Pack
//:://////////////////////////////////////////////
/*
    Change to standard faction Defender
*/
//:://////////////////////////////////////////////
//:: Created By:   420
//:: Created On:   April 20, 2009
//:://////////////////////////////////////////////
#include "zep_cw_inc"

void main()
{
struct CW2da data = Get2daData();
object oTarget = data.target;

ChangeToStandardFaction(oTarget, STANDARD_FACTION_DEFENDER);
ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER);
}
